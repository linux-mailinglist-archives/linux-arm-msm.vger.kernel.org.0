Return-Path: <linux-arm-msm+bounces-99775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L7GMyJUw2n4qAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:18:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797531F18A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 04:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9F1E13048464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FD427A916;
	Wed, 25 Mar 2026 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxglNcNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMCS26Yb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D971FCF41
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408736; cv=none; b=UNQqitg2t3iCD/tygJVQkRgcVFE5KTvR+6P99VfRQmXNu6Q1TIAVzMwyieJYxzirWcUmOif7wg/oKMe32OK1GLW/SCWgTtKbeF64Xl9at7tm92WLSfaHFcVPmNY6H39jT5ytz0hTWduCwbTwRYFKV8QKH8eNDeBMuEvDnVz2Ihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408736; c=relaxed/simple;
	bh=L/fbNuXjYn7XsRJDxzHI5vUb2BDiq7dkEs8JRNhYZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKMeZ7xP3lpPPV3MIbGvHCUmcPTj5J227ouQF+xgyCBt+VLQTYAwFh4Vl4scG6gAyqDaQFoXpiD+XXMIjJE8VMddsqBfckZsbdIgrYdibbBjMkKhYwcPSTDSJfur0O0WaEZ4BjJ/BYBd08R+BVm7NAmJE13RBf7ShOnZ1tJLIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxglNcNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMCS26Yb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMe2RI549085
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3t6OHpAQZ7WZMhx/RTKrRQz
	SrkeOVJeFRjxYYk/5QI=; b=GxglNcNTlqJeMYdS8Tu762wM2Ojiqd4nLyFk04EV
	4a4Ts2rRjdzMvtdjWM7BefspqKHONLySSBIBaki9ZZpES2vDA70hdTzxk1jKtNqo
	kPTDIld8GgO7Z/Pv7/gUSQde8txTPJvmMPWAGuavF5qSQy5Ht+qROEqxmW7hPETi
	HipfrTNFywYLTMVf9TfKV4Qzct8qXL6i2Um7EVvwqfsFY7e09QZ5rQaAqPB/d92u
	AzZXBYLD4JjIZezc+CNGDer1qK8rmFM5onm5BXtnbbD3XKPzWMoLyI4LIsGNtgKA
	+7/Rq4hF8DAZyq3BREw+0JPDI/afsoYewwiIRvnMpexY8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3rf0keb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so430043591cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408734; x=1775013534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=OMCS26YbkLWaEuTz2+pzyNgwsQQUc9gOGb2y/XM8AwZLy3lIpJU4hg3baBxe7zLTyh
         SK2tPHcW8AnyHwN6FDiUHeLnSTg4yxiN/BCrwK0x+/9UF99j1NZdB9XqKtAUdaPkfx4W
         NZEoblIeMFj3NQ4qqCPw9765HBe673N6amHaTqdDSFT9QLoR5P3B9f3e+5syHDMShk0a
         f3Tyv4Uqeq7us6pq218nkV6kKeOTXjxt4eBIJcHKJTc6xFPh/3RYHQ1cpYrcH55R/3da
         0aCctwrPfgxguUz//Sa+jU5n3Vt9UCavBAgjikiOcn4fZl5VjVCbpvMP+wgrH/eBctsB
         5NSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408734; x=1775013534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=q7fKru3Fxc4+sEvVY2lZhQfPpux99x24xXn1XQxUtmWpUKIV4q8gyRlU8MnQvqpgaR
         Fxx/vHUZOUE187k8+GGM7G/KBD8VvWiTL+DB9l0dPCnNA7FrmZWy2LVFa6obwTCFCiUg
         Eqx12EM/Lh2IsKZgOne22Gq+HdKJBczX9uPh3w1NJDCb/zJt4lAMayJ9FAtefRXzYzi7
         hNZhUFFpw6HGYN1X/ek0v1h0Rh8fnKGnHJq+7P6jKkkb7obyHBsmxi+YFr2G4Z3yweDq
         dejt+Q2/j56wvZOkEXEq5GLoH+ZTn39RB8GZfzKuT/EaEZ1mQTDs5kEdIoHi4SmZjchz
         OCXw==
X-Forwarded-Encrypted: i=1; AJvYcCU6d5gS7VOEg6hlpqjEVzLaxDsMAguqPN4qAVQMsziyyGqDMBzyvuPLCYxVCHnBbSnd7KCxmE2TJTph3Dag@vger.kernel.org
X-Gm-Message-State: AOJu0YweZEU2p75k9MsiHWj/FCN67Ju2KkySGl/4Manh299Vuz+YF9w2
	BB7aJbl5A+GvMV+L6q5nrtuES+/j3i7CkmUeZ1fZA94YlovE3XpNG6B7SN0dLda13XVWPmnw2oC
	V24Xe7hh7GLzAPq8IoSXbDujKFDHcR4poV5rvJ3RhpRCQyTkrr3gCybFfT/bdpWAYEC5Y
X-Gm-Gg: ATEYQzzjUDgBUI8yffYwvH0tcgQcbHwvgespLViJrcIg2lB0u0V8sfcbazNDvkVZLfy
	IsFdHhUqh+7LwrlnR6HPVETWHF+TEgnvzjNWZiyzUcdsdjXZJjZ/zJhpcJVjjQHh0OvGxxp4n4A
	u/45m1LSYBEDpbTImdpk9I41saT+6kYljeVHW3jecGHjZdD6cZ/eGDAv/3eMUlG0K8hNLS48+A2
	s8y/HKBzOcn7h6DK9o7Q3qUeSzMsIjwwhQUtwTXhd1IgDHW2UArWaM/bKRIAtc6SFthRC7Wos88
	vzjyFR6Ynpd/j4IQRBO+Aekne5zWHs/G+m+bY7V/fvHrL0gu2EK70juIt9ywIiaGKnS8JWQyZ9I
	rQT23+H5eO8q1yslvgoGW42fboUXXIFO31XZlDWrwZGE9Rox3AlMjKnkEzHYLqngj9/KULvfpvJ
	sXNWIs2dttYXzOYdKRrZ8Yecqig4YCXex0NtE=
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31300041cf.46.1774408733575;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31299811cf.46.1774408733116;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf960dcfasm37894941fa.0.2026.03.24.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:49 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <eczuhmxgclyc6p5vj2e3vtexm4n25mpjkfinqyx6wb7yeddcco@thahz4f5lmhg>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
 <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfXyXr4a3nHO9md
 D3TeWkPTmojfqXN15gKP5noA2pwYbb3RY4VPNYvORqvbHuHWOtF/5jOHdSH+X43hzjoH+79nPrI
 OXdNlG+2pYD4axX4hz0M14HUQq3osoUKtAakiy2WfoCYUengKZRwi71gZccbVXWcMUHadfSviOr
 34V7CoejQGSKprl9drFnvUYj5fwxCn+F1nzhlrv+rwAxtPYYth7AP6bSrwXiVQwLA7LNie16KQr
 o2Xv4olLILGBdwABaySayO+uUvwBATjJkXg11yxeWVOrOyshUTu3nTwVJug9DK7vsw5LCQsDXAi
 zOVXLxxHc6a5mzG9S6BXNiw1pMttKZRh9IrUoDk+cxDnWrTdb/Sm+mQ6QGX5Ejkv8AjuefXuLQ6
 01TgKhiqgXOoYaGQMFZX2YHImEpXq0NqD37cj6etnESlERHx7Avo8uGySXdUzXS9j1wK6rN7+Pp
 YFu8EyqacWiXfQAaMZQ==
X-Authority-Analysis: v=2.4 cv=Ua9ciaSN c=1 sm=1 tr=0 ts=69c3541e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=q8gErFrpIn0Q9GUK0HgA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cb0ldSUKxWoVA6-VARlZEbDoD7sPy7sa
X-Proofpoint-GUID: cb0ldSUKxWoVA6-VARlZEbDoD7sPy7sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250021
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99775-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,vger.kernel.org,lists.sr.ht,tuta.io,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6797531F18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 02:03:47AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:56 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > >  &ipa {
> > >  qcom,gsi-loader = "modem";
> > >  + memory-region = <&ipa_fw_mem>;
> > >  +
> > >  status = "okay";
> > >  };
> > > 
> > This looks like a separate fix.
> 
> Should I put it in the gsi-loader commit, or keep it completely separate?

I think, together. 


-- 
With best wishes
Dmitry

