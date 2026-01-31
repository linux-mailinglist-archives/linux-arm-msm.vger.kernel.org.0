Return-Path: <linux-arm-msm+bounces-91349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rYdJLGWwfWnbTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:33:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF6FC1147
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF87130097CB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC628320A00;
	Sat, 31 Jan 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzLo0yDq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwqZpZrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906B3164DF
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844834; cv=none; b=Hb30tcJsMII+iuc9rYhcAHHZhjf9M3+6GO6+68PzhhHQJpoHvqUofBw/R3zOkkdXR9XrMd5UVlq3ifYglzwSwqKnYSZWjAPQcUf5Qlcvyjx2eqhS3fZxVOyyAMDe597J/6f6ekXhBJcz9Akga0Wf8CNORKCExQuv00lh1S96KNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844834; c=relaxed/simple;
	bh=A4J0EZts1bwjvfzamlszNc5VpBQG2B+2Vn/lLJza/r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNaNBG2/Yn20xnumbRvhwmao4FMME2tUgFR0oOitV2kxVPzuZmHt1LZSHzCDPRBbjsgEDbyyDngrS4/yrI8xpSU0OIYt+lytncrBvC0mvhbgeGmAxq44AT7Jem+bIqNzESz60lioDzdds5AqZQTyi5hMu6TMPYHUmzWaCwjCwjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzLo0yDq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BwqZpZrD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4YqG5658501
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7amPJSwfFJ95mZl07vLQ2mt2
	3xBnvo4B+KI75ZYl6To=; b=WzLo0yDqS8K5lWWbqx0OoLz0BRZ2xZeeA0gfvLyd
	QbF21/682SgtOROGsXbNnJf4YaevGmcJzya1q9NxhMmE3cM9eBgXlUNseYtmJI23
	ioCUd8AwV55drxCBOh8zN2JcAgsji/hadZ2wuTjMSpGCPnzT7qDSx/MDn/+llugG
	LuKEo9HbhOO2/udbdyaLgyDpkEbZ3opDsfYbRmE4K4qcFA9Ufr4tHTEBCjDsU/he
	F3WBa0bfoXtHquqgI2G724Q3b1kt0FaZ+Y2zth8/FmCzvUl0D1/6ZSZNMpPvjf18
	8o9nvyo2SuR3k56sqRNjz+BAIoiCDLQle/XBqTzJYjL1lg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2gc4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:33:52 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5eea2aa86a8so8448503137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 23:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769844831; x=1770449631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7amPJSwfFJ95mZl07vLQ2mt23xBnvo4B+KI75ZYl6To=;
        b=BwqZpZrDKInPjc5amYUUApZ5s2sw6JVJTqcbKxuP2VB0tewXN4cGWY4fOXTfbsdsh2
         6zFczUH8akqX/W6Gp/MVo2RQK/RQxWfXDyr3U/XBBitMLwtaCE7qTz1ESOfj240jtleF
         HjugPaVkhs+zkE7St7Bp7T+C1h8MSl9r6uRVDEAT3+Ibq9w8cjCRpGMTV3QadOPRphQY
         fNyoR/b/pbYJuuqVLicKfFn79BQoiR7OIsxz3rWPO0ukPg2eaWtxc9fMBG4bXdYIYaqB
         kHVdXRnhTEFAZEf+SKyBHj5r8QkUQcbCXE86DGTZ6OaGsIzO/RZ5BvE+xCZOVd7UqKsr
         IVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844831; x=1770449631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7amPJSwfFJ95mZl07vLQ2mt23xBnvo4B+KI75ZYl6To=;
        b=eHs1Dz3193nHevBxyUxVZygcSN9x9llui76gOurrUY/gtMwFD5lGRuSwaM58I6X/d0
         T99llxJSF8drggXDonPkH7N+pxAYd664vNqczh/gMxbuAR4sfklT799pPwt7hZokX7S3
         B8KwlXDM6rndtrjp/MyY4+nxMEt7N2eHcs80HmdqAlLcmT9yllJ3E7IIiJF5XirwJe10
         pqteHM61ol+Pp0c3gHk+ihHBSvwnbLmn1l1/cl21R9ERtICaDATuiIxJhikxNDy7M5EG
         mmM+mVvWnDZVr/9nwlzMAXKB4Rk2Dvwh7ZIRy33CTomzy6CPHaBlAzNgPalDDNiMSUEt
         CoHg==
X-Forwarded-Encrypted: i=1; AJvYcCU+sjWMK4gJA5ifCYJrFE6bkDQytq6AtfwA1sVg82XgFMYa9vF5EHYXPgGqFWKHBjHNRRg+1eAEwDF/Ng9Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRt2MYwsvTEd1oeeCGIMwZrYCQRU1Jy6CRYz4IY8C0qEwheEQ
	h/Ds5knaJhwlT7bQkaGm7b1Vq3JhVeDz6kqWh1RskhVeIaQuwUXeEkNKN4bZdJUIbfonAxxnEaB
	3Nz3iFGSryrKvpxoi4e/e5Cy5dQU5xCEAfBLWHixER5j1HCbUaOLI6e855fK93DH3+sbw
X-Gm-Gg: AZuq6aJ2CD7OMcyzZ1Dh+4WuVuS3r5cVimLc3jfNxq2iWK0PXOV4rLP7dLq3KBlpZgX
	auDsX32sNnQOC51qW2wpkWVPs4aubebqxVmUYdVzykhzSKI/GUn9AfZFapQ6soP3Zgf6AE9QCr0
	uGUwutjIBTo8O0gpNFTA2OwukS6MPQLixUAQrCMDdda2XuDEREyCINLNYB3nyOHWaCTHdY+y80s
	5LY6D7gCaM9ZlLB+GkpLE6ZXZXX230O2GbOIPYFlaPIO+QVWLP9SM2e0EEDnIVqNpxt/ZUzK8aF
	i7rwpF/ngGm7OD6xcmTEO4pAHfLylzWfO0fzE6XscZY2M0PS9Y8E5+ahEZpumCCvEuv6o3BEPgS
	l85ElE4F1L33zddkHduC6tfKWQOIeX8DTOaf5laWrcVWMKAcFFdB9oKoVBFoAwJQNQ7ShlnDLx5
	985/UccKeUSKVgJw1tz4gM+lY=
X-Received: by 2002:a05:6102:c4b:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-5f8e26341f5mr1847499137.29.1769844831214;
        Fri, 30 Jan 2026 23:33:51 -0800 (PST)
X-Received: by 2002:a05:6102:c4b:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-5f8e26341f5mr1847485137.29.1769844830828;
        Fri, 30 Jan 2026 23:33:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bbf76sm2216961e87.87.2026.01.30.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:33:50 -0800 (PST)
Date: Sat, 31 Jan 2026 09:33:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: sm8350-hdk: enable Venus core
Message-ID: <c5ry2e5whpnoiqvcwrfxf2betgwmw7kmtcuqnk6emk3zaf53c2@h7hmzwv4lyc4>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
 <20260125-iris-sc8280xp-v3-7-d21861a9ea33@oss.qualcomm.com>
 <abb1429e-6251-4827-f0e6-d4a6e4d9a43e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb1429e-6251-4827-f0e6-d4a6e4d9a43e@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w3NIgEnWb9-oCPRhDHeARfN0DQy6URaW
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=697db060 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5okSEyyqmTaM0kh53ZAA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: w3NIgEnWb9-oCPRhDHeARfN0DQy6URaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MSBTYWx0ZWRfX5L7/IlFDenYL
 sZZj1T/jHlGTQb3a7t/57OeCl6iWhkzLvCgrWAO/j6EzPiuMBh2BzEFtZ2C5A1vdEu66DDNs7sp
 aA5YqnltQxDnKvzgTfQnAhaHCEgKRSqN2FVPzII3qmAb94f3GPue0/Ur31Nji57Y1VGj69cPtdi
 WWVzpZ5UtycqzzqUvkVS4dYtjMwdqiAH9XQONmh4GzxgxMsFfcwD5dk51Q+S/6MuLUo01+DuLOT
 Gep71a7IxjyWyMGoH+QJ7VXSBv5qXGmjhBZulxam4oK4+xCbf2tHCD6yAwc1usiX3LCvkIeeyE2
 aJJ7icR/jcvJFaWrFmhL3HgjkTsjpVuypX4i/MCPddtkrKHNwP6Cqe/CFC9c1TfPmHB88tQyNPH
 UhGuHU2Q/7XEqS6FskvpouLdxcbCXgj54AAIralP1rrtesIbkGsi8+fnGT0TwHi0r3qZiveHUpq
 d1BsBT028FOwp0Ga5TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310061
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DF6FC1147
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:37:35PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 1/25/2026 9:03 PM, Dmitry Baryshkov wrote:
> > Enable video en/decoder on the SM8350 HDK board. There is no need to
> > specify the firmware as the driver will use the default one, provided by
> > the linux-firmware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index 5f975d009465..79f024fd47f9 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -894,6 +894,10 @@ &usb_2_qmpphy {
> >  	vdda-pll-supply = <&vreg_l5b_0p88>;
> >  };
> >  
> > +&venus {
> > +	status = "okay";
> > +};
> 
> This should be enabled only after proper testing on the SoC.

Ack, I will mark this patch as [DNM] / [RFT].

> 
> Thanks,
> Dikshita
> 
> > +
> >  /* PINCTRL - additions to nodes defined in sm8350.dtsi */
> >  
> >  &tlmm {
> > 

-- 
With best wishes
Dmitry

