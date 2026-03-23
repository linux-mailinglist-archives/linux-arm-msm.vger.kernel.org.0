Return-Path: <linux-arm-msm+bounces-99217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLd4LZAiwWmTQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:22:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 644382F1248
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F1E7301E995
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59920387593;
	Mon, 23 Mar 2026 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnJwlENf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6HzPIPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCF833D4E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264856; cv=none; b=XuZ8TA/tuvrfjo4T8pPIVDNt6jGLM+qOMaNX1OJPydhHr9bWnBJQNeYJspJnUlQOTpecuYclC214kbOjQjzh0K5JThUDOtY0oOyUQrFbPU3GDaj3Vh/odsprvLV2zjEsIgIeRODFiUA8otsG7xlcMHwtNEHzY2kxOvf8zh+lppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264856; c=relaxed/simple;
	bh=0UmgcQOBDkYfiHuK4wqGI3J4ga9mXxdIzGHPC2oGJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxHOL4sN2PLwEQnyqF3ecmouCFQKLCEXlxWNJjpA2xburqZshZAxIHrtsP52CHOLkFNyBL43DVTcPb/3TOEfD5RkuYIsLzw2FWQawwFP3x7BljafFSi+DxjZ5lZ/hN/JEa01ESbtJY3ClXGCs3l0YRKoyx2Ob8eNkmst6vbVn4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnJwlENf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6HzPIPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N71SB3949420
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i5tjGQ5WsisvqjUSW7WzmXu0
	LITnZly6yrYhXPmtf1U=; b=jnJwlENf2eB2GnlfDHWCertNfcYzZCZsafD/cpIp
	frEA9zk6AgH2Sr8JKoSfqF2EYCgIr0YPYqJrNTIMbZZDONe4+a8QAS+a1DDJKw84
	6dtKYAjtE+fTF3TFpcS8OI0wsPwxd/i9RvBksAe82/gkUMwfYDb2CWYRSsBV4XKk
	XMbSi6+MSsv+IyTC6mrFB8nDECamhoT5cP9sDzvnkvyTIv3H8xe+z0aAEQYI+pmJ
	xiw4ehSU6ZFiE8GGFBwL2zV3P5dBEBcir5ouqvtlvAZbd0V3ntOdYSAFwyfn5eUp
	JfQBAXdeKLyl+YwD0k6/kBuPVzfyRb7ZyaIRgq4dnu+B7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghd045-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:20:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091782ab06so90379681cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774264853; x=1774869653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5tjGQ5WsisvqjUSW7WzmXu0LITnZly6yrYhXPmtf1U=;
        b=F6HzPIPPKzvsD0GSZemEmpJmXfgpb+IjAi6VGBBCTxG1MYBkYYLT+SxnKvsUN1xR5S
         ml/t8736QwCV37m/Pk/0wCFjMbwGLMGhGe0AaROhtBo+aMzf4gspxzUnlYoMZer4GeEA
         tk8iid+P/dK35BSCV8gg9KYRvNrrdDhu7r2Qskas5quAITmHqhVOB9HLJr+s6u+KuIyR
         Ci2V7vo1KEdhE/oBb7ggK6LeFLy5huKUyaa+vI83p0qiGf0MvmYg8OgEY7Q36zI0pewV
         Rtgl+oGNpa18bShzEe6J+xwMv47J6EEkapi/aiREKEnZ2bWH7XxnHObnfFElr/ZBOL9d
         rrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264853; x=1774869653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5tjGQ5WsisvqjUSW7WzmXu0LITnZly6yrYhXPmtf1U=;
        b=sxh+lr4RXr76rgfEa+QvzoDJCDr+4/PHaP53KcrhQFfZWQ7k9mk2Ee7bwKal8El6ua
         IjJOrSzlseYR+woEPSqGdSnsNivQq4FokLsQs3faLqEiOWp95MbYvR/9qS7guzyH7gNU
         TSEOMv1GpbCe+6hPM3Kg1xFvPYWRIUt6DExHXtstQCcdeI1BuhOMUtocWIvxQvhgLBm2
         atB4MVHBwx7/eJkf6EkG7OUKCfLtEvYfOYVr7HmAdkOQv6F6H8VHAtcVdo1lwPq6WDij
         nQu62p1GDgUWuM7eHDli3H7wsl0HJiqH5dfIjifZIdpZIrh2iqMz6USU0yyviLhboByu
         gaEg==
X-Forwarded-Encrypted: i=1; AJvYcCV5ChIbX0V/PC7n/thQSpU/Ti+/fhmIP2RFTnwz4yzyt0505L3JAjNtQruLAyvwEZu5aMOKCqqef1D/KGkw@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmyK3gBA9m8a9XTidNL67v+CCPeIG6Y9Q/HAnjjEQ40YiPuMs
	RiBnqci9JWiqOOhnDlCXSEQzX+QgU30BLKSIJyqChIJq6ge40iG/2PU6gzeJrjGYAc+Nj3I1q7z
	aLCesUYdavItcogvciX/Uqrt/ZZ9129accBiqGKWM7AD1ljmNk3QM0alK/yt2kH9fW8I2
X-Gm-Gg: ATEYQzxQI8KaMENj4ib5qB3m6nKTcXSh494r/V6HNAAqXmvjX62WmAAQdDg7EHlRmbw
	DZAriJ++802PaDfYsse296/YEWGaX4K8mCaVrqtwy/bn0W408HvvP1oPLv6OWMfKDqqbeL1A/65
	5gvnVJpOnhnmpAuYSg84nuTvl1B3Oj2zgHATlwLxF/xyEcra6WrJP+NcdG89gt4Enc0eZpRTIN2
	7Sqf4m598jzRvf0wftey/9cLv4YvzUejj9lCwiqUU7XZom8D/8fa+ivKB+xxf/TSAVs5LR66auP
	NU3WeLr/0cZG0Lh3xrqwmzunnQra0cA4UeXhUQAnATgjb6TxvGASE1ntYN0LzNXumpMMy0HnNRU
	us0vNtQG6jpLPPQw6DRJbyLuYJLIJTpMzmQ==
X-Received: by 2002:a05:622a:580f:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50b3c78e117mr162741001cf.41.1774264853222;
        Mon, 23 Mar 2026 04:20:53 -0700 (PDT)
X-Received: by 2002:a05:622a:580f:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50b3c78e117mr162740661cf.41.1774264852738;
        Mon, 23 Mar 2026 04:20:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm405653965e9.0.2026.03.23.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:20:51 -0700 (PDT)
Date: Mon, 23 Mar 2026 13:20:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <hecpwfi445hkc24mcj4hd7om4ztpeutqn6lmljqcku2nwwchpl@jrvwkdhv4lth>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
 <79ae9efc-7f99-4916-996f-52ff5061261b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ae9efc-7f99-4916-996f-52ff5061261b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c12216 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DDrYQGrwWQwa2y7XVrkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 0iHKbAftX0-ph9_c-aIXWrNntJSDBVbU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OCBTYWx0ZWRfX5Q27/Dtvga5P
 qsZBp8Ub2Gb3m8sUJ4igGRi8ecK43hYcVC7JXmY8Pf3gVmPmtrlHlWR5crsu4zCrV1ClwI+DvFx
 p19i4qGqHdnImRq69tJ3Rh8zsiVMbFFdRF4vuHVnAQqJwbIuVeoIXww6QlIOTx0uZDtYP4xh6yn
 gyzsWn8PV478wBxLqUOMf0iFA+R9PjLmkRsZV5n8taZjRkO/43IWJhPmjpTwoUBCljUdG6ESDg8
 Pcj6UpR5VVqNh4guy2YmyllV+PlgLiqjgq7go4wNc1gRHMagOd73dM5rSZY6d9XH7CvVSOogiLp
 JkMzsm9udm5DsVhxWbNcSV38x4UeNtveNsZeDgQlnq+aF71+xTAHAy0U3GkgieKG+9RX8w5T5oU
 W8WpNcMnhpuk230XP6m2R3TzH0fR/ZW8tr0GvPnnnLfpVc2/c0fJWsDNcw8tOWl79cjP1DAFf/I
 Q8gUHxyde+1ajK7P0aQ==
X-Proofpoint-GUID: 0iHKbAftX0-ph9_c-aIXWrNntJSDBVbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230088
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99217-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 644382F1248
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-23 11:50:37, Konrad Dybcio wrote:
> On 3/22/26 6:51 PM, Dmitry Baryshkov wrote:
> > On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> >> Recent discussions off-list highlighted that the GCC should vote for the
> >> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> >> aggregate the correct load for the CX rail, potentially leading to voltage
> >> drops and system instability.
> > 
> > Should we add it on other platforms too?
> 
> Things generally work better when powered on

Yep, definitely.

