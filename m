Return-Path: <linux-arm-msm+bounces-112877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pZhpH/e7K2q6DgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:57:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D401B677878
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 09:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UOfkDqOc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PvGmJSr8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112877-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112877-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46169302415D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 07:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B4132E72F;
	Fri, 12 Jun 2026 07:54:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61FC305684
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:54:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781250876; cv=none; b=T8fwN8UHVfX3X5w9UUQqKq6mA92JBCJ11+EKxiiNk+nMFZs++aDnoIxtA3zGp//bM0IjdUqhFkBqtmx0Ga6XHA3pSdtJkD7Soguh1GqiraJVbQzBt6DjVR12M5EwGZbK7deSPUVxhcXdIP827/B4ND029HJf7JES5jEOgCe4pKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781250876; c=relaxed/simple;
	bh=hsCwsgdCEMu4ncQekySiE2CRmPl3gfKT0FoyFFRUY50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CugAsXqwRNYqGkvQ4fGCQ2/Q/2vSN9elFFJhxoY3vpqYWjD4BOfjpUvT0L4yuymG5CHutSthn3ReqrLKRhM14tG1RmYiPkOHSQukneYaRbmOyMOHsKoAkYGKmB+LVxKtuT6NKrLhSj58t+x0Xzo3LxpTbGlstS5/TOGin9RCzgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOfkDqOc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvGmJSr8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BsTt2534066
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SG8dIIDcbbI8TB/iE9tNqMJF
	NzNGx6dH9C/5q9QW9wg=; b=UOfkDqOcaZ0oc4TTRVjtyPSqXyKQ9pxbBfeNLo/3
	pU/77yU58mB7I8eod+UML1CjMW7VAtVOtHxO4KkA6JQBlRLq3B7c1xwwPQokg+xh
	2OMHZ67TqD0RZirVuBl4OLhotjdMHATTJalbF+AXeqaGlFHOP+su8EB/iYIBj1Uc
	vz1Wqsz0L372ZHq7jmxnstVjaIopig272+OU1AtWbdY2nVLjwGUG5V7rDBJY3Ct8
	ESl5ufJPdlk4l5MdfS1nU/nIQIv+rz1FdGezESLOGKjgyLeF7sk3MYtdOLzAowu+
	bmpi3Rbq6CBYFKoi3wYxR2JluDauNHFEUqZb2ZEQ8cwtjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u422m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 07:54:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51776d4355cso40229501cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 00:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781250874; x=1781855674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SG8dIIDcbbI8TB/iE9tNqMJFNzNGx6dH9C/5q9QW9wg=;
        b=PvGmJSr86T/90dpkVJv7x5PIqDhbEuirmCMwjDyuoEZ7XyZWzKoaU+uMhRp+PY/kQs
         FNpWui5i7NMmZ57aib0ElTevTFw7WI/ZSn01ImAR36WdqzgafeK53Bh1RQv5HtwbxUyU
         NWAkuU+oEvA0hZwjdVu3ODdqjk5KMLgpu2dodsCzaI7rTfzv5gPVUMaXUfv/vhU7iK4Q
         2IjKXyYwvrgybdYM9dI4+shsjtIqypIHpLYVIK94BZR4azAGB6g2JZdMr+D+R/uh0C/r
         MZjnBRkPHPMvEGK8cqQZCxVmg5vvoWkC3NjJeiA9fYiuMRF9CdRK4aYb2jDiszoeHCNg
         xtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250874; x=1781855674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG8dIIDcbbI8TB/iE9tNqMJFNzNGx6dH9C/5q9QW9wg=;
        b=WBL4fbeORZiN72g/3uqtWbrf1KPdY0ek6k5t1GF4CyZV664t/QNKcs0XCxS8w8bM7Z
         cFrwvYpsdhDULSTizAvLy07ihvM+EOQa6aPogQe/gEOhRSqGucCbATkOAbDVwWDMKBa6
         nj4hQkh56vsASob5dOoNjfsq/MJ7cxvhEZsJtpILVVoy4yStDChPHmMIWEev94U/AKSv
         2DbPMcJerEvGD/QbByfaWiKM0CQ+LD62bXbXrPsAEsnViZqeFjlH50Cg15mVm3kmrI27
         HRu791I8fd4Itz4L/WsV7qPE7g13MH2toJEV2xwo3ZRqaSbAaDCwYosAxXp2r7u7blAW
         lgeA==
X-Forwarded-Encrypted: i=1; AFNElJ/0SV+AgPRBEPscAl2F8yjKnrd+Ar7b2CE0k5j+QfdK27m+9NNUYbzqu1ftliYmdBnxUTjhQs78+TW0NSM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzao5vfC+Q7BL057iMPcQOvkFcmD11FaXRTW5LPWyLrQHG+bczq
	qshWR17buMYFDKAyYkaNPweL5q3GfrGUTqHYaytXI+Kk1tbx0eBxh8lJ9Rizmnjt/qMiHp/1PL6
	hMq+BRTVqQ9D5b0ASedfmzSGkPvsYcjQ7wzHG0wTdEG+YIVj5TdibKCAnGc3PpzdDiGpz
X-Gm-Gg: Acq92OFmDHto9x+TsNrQoF1gKF3voicOsl2MgPyL7Kz8xSX3DlFv0tjvTZRdCzVP1te
	/Tfu7aWiXRJmFfX0mrByhV/hhFN3kivLUMkmdIJKJRftY/2cR1UxlU6MKtR7NCs7EwzCvq9CemD
	qCe1GXa6q7ZxCUNXeFA0RUstekQGVNBYtXzPcSoeaJxA8kcIVYP5LQ51nLKoJMl1GuyVUjO/tlI
	/bV1xpVXoN5MGITMSnvwcUzN89tqT6dewYjyeDVN0C9NzxAgCaLVG0ZCDHoagND8099TYJ1w5g8
	VqtxjQfeSrEgAKozHTinsl9cfuu5Ud6zgJaUzZ7BOcY/vvscE4xy4gDjiqZ+FOWDvXtNZfdN2V/
	1kkY0gr3qqU73fms6spLwluF4Fv0EvPBTlpL4ee/CjHhYxV6PBqJq2HiaFcPS56bkOIuOFY0W59
	DTnsVhn224qEhebo08jQlveJkth17CVeZKWjM=
X-Received: by 2002:a05:622a:5514:b0:516:d83d:b28 with SMTP id d75a77b69052e-517fbcc5b67mr25698761cf.17.1781250874018;
        Fri, 12 Jun 2026 00:54:34 -0700 (PDT)
X-Received: by 2002:a05:622a:5514:b0:516:d83d:b28 with SMTP id d75a77b69052e-517fbcc5b67mr25698621cf.17.1781250873624;
        Fri, 12 Jun 2026 00:54:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e171f94sm320088e87.37.2026.06.12.00.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:54:31 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/13] arm64: dts: qcom: agatti: Add DSI1 PHY and
 sleep clocks to DISPCC node
Message-ID: <tjfx4s3j4xbj3ddc2wk6rxatgbeurc7nh6vt2xlc3q5mmymfg5@bxwylu43bsux>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-12-8204f1029311@oss.qualcomm.com>
 <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bdbde3-ac7b-4c40-a8c9-7ffc58a180b2@oss.qualcomm.com>
X-Proofpoint-GUID: au6JwwnqDCMBaIWX0BDtsKzz0ijorrP4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX4aYXZn2QneL1
 kkrqYUGfeHbtUaEmAPbKD5YTH6SPa0cFLmOghFcW8djy2V7zd5u7jI5dlz/zNMSPdBgcKOe7nKt
 dHPD2JMMgFudxptTsFSx23foUETLn6M=
X-Proofpoint-ORIG-GUID: au6JwwnqDCMBaIWX0BDtsKzz0ijorrP4
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2bbb3a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=sf7wYq3a7C3g1Bpdey0A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA3MCBTYWx0ZWRfX1C/h8MIKzMux
 RZFIzxcGjr47WQ5VOtVmPRczBJdt5bmMVqwg6CX18MBnwAgzUJbWRFUtxcbWWa2JRP86pnWHKik
 QTYSDexvcqYcSzXawqSDMhF9KKzshbd9O/iUIIM9qKSCLUIV1AIZBK1cQqzR9Yod0zZCH0Z7Kgh
 dtGtWN5Hn0MyRm7hV5+5K+sDwcD5fd52AJ330DS6c1i9fXDi0//4jfXt8fAFY5iuQdXP9OjG5iu
 l+VxZ7hiSJFmXexkfYDwtgn+t03SCY5MqAoJeZEaSb0JP9yD5ESHyVGE4iCk4TJv4PMFB7JlNRm
 jiSypMTucyyk/cOnkE1rpdSzX4vC36cunfUbiFosqU3ydHAtsvJLPjDsHcC3S/q6nfCj+TFj9cf
 I8/KPZIWkfKtU0gUuFMSVuxRIRzkVof4cYi5ITErr5isH2xb7r2SdonojfaSWgt3W85aHNdMGr3
 wa0A1ejFcadShGdIZwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606120070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112877-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,bxwylu43bsux:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D401B677878

On Wed, Jun 10, 2026 at 04:02:02PM +0200, Konrad Dybcio wrote:
> On 6/4/26 7:26 AM, Imran Shaik wrote:
> > Update the DISPCC node on QCM2290 (Agatti) to align with the latest DT
> > bindings changes, which adds support for the DSI1 PHY and sleep clocks.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> 
> The Agatti MDSS doc suggests there's only a single DSI controller
> and PHY. There are registers to support a secondary PHY, but
> are those just leftovers?

Yes. 

-- 
With best wishes
Dmitry

