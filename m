Return-Path: <linux-arm-msm+bounces-93346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBLvL5fMlmmSnwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:40:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2595D15D16E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2732C3028ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F349337B9D;
	Thu, 19 Feb 2026 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjA1NgnI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="keDD1RoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE533342E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771490448; cv=none; b=Vo01YO0nKv5gOAL1xKBl88EWVxRSHFWSw0B9yUlbRGNUPr18T4gd+gSRtNK3gTzx6ZicP1FOU/GmZ7Ti7LpkB4s868GZAEmc2x4vbcNn5wfYZeFpkacsoy9sOUbpFo+CltmHAsZJxfb4eqFzw2sl16+hoARfo7bSbf5mWquIOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771490448; c=relaxed/simple;
	bh=QHyfMLu8Atiwa25aOmWyojMEjIWAKUbAVajbbeRlS/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDbIYo/nF9X0UmSrS5csDaXRtOMh3hcxj+JZF/K8EoGMyF+Mdioh0Jvnx3x1leGN+IdSU8SdNMyW2sSoz0k2G0ilM6AI5omXGt0z1BeNR/Pyp6rs5kTmUmASGFdZ0fv6l6pVCZSULJEYZMJmMaWrqjhOSJqnPyfJ+V1E0MkWfEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjA1NgnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=keDD1RoC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1F2at160557
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 08:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6OCRkgwVU7K63lwqxmEliA2O
	LUK6JGdhpredyglbA3g=; b=hjA1NgnIL+v3t7AR3HR6NLu5tixye3spPP5DiqG7
	3/VTdohKVC75o1q3vLmXGNMhHb2zlHJyy3FQ9hoogjggSrrI80DdnJpdLNkHd4Xb
	6vcVfxNcrsznubPnTr1C1mQA4ZQfadmmb1Erp9uoptD+kEJf8jM8L01+FSNI5W5S
	4Q+sps7t82lQ4rybJImp0N8rEEsLn66VCQF3qZjMuv33Y4fnLKtKfazS3mczACKU
	/IZHlDLNpyFpUmtEk6/prozcIzfGe3w4u92CmxSVIGT8j9Zt9TQgzug5PlZIVKo5
	2Tp7lIlvV1oX95LXTpHZXWTmcbC77dD6hAheJJyv5eGjjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrpg8t7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 08:40:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so401895685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 00:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771490445; x=1772095245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OCRkgwVU7K63lwqxmEliA2OLUK6JGdhpredyglbA3g=;
        b=keDD1RoCLfxze8NC1yKQ4EGuTPMWm5jnsuGFB0A9KdqzRhQ9SC5+jcJvY9bC4e5x0n
         v3UclYsTZzUYWvCJ+7U2YrVsL9D6Zs1NwaYqW7InHY1YEp87bvcIKJjTQ9AAswc1ZBrv
         MlKJ1KxVf8JSA8sjRZD1Pyi3z/n9RQmOPnqzWl+j4A8dvT6ByNUWrmzISLGmqVy7rB3l
         LUmz4KxFH4S2g+piAXoC1/wI/bO/0t5HANP7m+1YBT86FRLshSwIeyMQjA7ZCKQ7giQZ
         vhA3/pu9AWUwKoxXUwjeTmY25f5BMVh0dhHxHknoWVIVn6tXUlLLKTdn9elau5kyTUv4
         l5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771490445; x=1772095245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OCRkgwVU7K63lwqxmEliA2OLUK6JGdhpredyglbA3g=;
        b=hFIQJ6wdIe/8dDjR3ERhEaERaYnCEEGdmshEXvuPS5c4AECvBYJlirgcQIkhJnniaz
         nWgacYKmhV1lWBFojGcVBVdqBa+7UZ1w8CdmQu8cd2S6CEj0JQVDhkckudHK88CCWK03
         uC/FevR0UbyTd3URr5V3ZadfQhjCMYYdmjBz/cFUzPXo/xa1UQV8tI+Z5JiVUrRo5pft
         WtMGfQRvlqJ5VfdMvEQMop8s7f2MPfRIeVSPriGO7ovdZAUQg0T3oNfj2w/hmS/k+u7O
         5Lv7uTLVUgUhnEIGw07zi+wtweJonJ5OOa6ROdMd/dEhnFjv21Sl4hHFdKLY8aI+gNXb
         PtNA==
X-Forwarded-Encrypted: i=1; AJvYcCWOjJQ5Y+YoiJ31tzzlR0hjh8NYgZ57r1gd43P/i4x0Woogst8G9JlCEjw7U3WzHo58+zJ2QpK6P25suwo3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf0BEGUwz7NZTSQiLtLa51fr9z0hx7LTWg9tDz+eldOP1a1Fqf
	re0G85S4JUNDv6iLz4+iuwNj6kbuP2J8AgSy9Ni8vbIGIs0iMfQM1UYWEO1KW62WLJ7UJ2NuEQb
	Ry6/z883bohp9uiUJ53/LmocJT4cIylTbF4JOXRipgabmzIlVFhQRpNNbRakEtKtzVD8d
X-Gm-Gg: AZuq6aLnUgec1WtfiJlL+X67JxXgaHfrpQUQU+Aj0vXuTIoWMeiR/03fBFBVSGz98Ws
	G4efBeAfkGDhuUng2AoqJr3PkgZYutiVHwQJGaPsC37iMZ8MdeU7IKyV3Tis1haQNX2Msp3jne1
	SxXV74SP+qyFt7bErAMEbwXmLAd/j+o+szbWJz3gLW2tzWw4qtteN/lSNSnd3AUSmxTVF+MGxj4
	wNuE7zSU1EBX385FgrCnGLmeIeAHfpns5zJ3C1QdBJXRD1yy+XzB2IlkqaFmVfoipYvZnegcp0d
	JBn2GgITD+jqkwM3qyxBH+t+cSALyYQeWlZZwHa8dix1QgTadFRrwtz9bqp3J6M0T27Nh9Pwyuf
	4Rkc+f0zQyL/NIiGUiIgsxQ3rLHAhxGQaZHRaF2goMq+mka8jdkfb1/BPCYNCxsVO46NBAMIyQt
	TNvjpkb7YMfpoYNW7I+Ni/NJ1exgFI7QEGAmo=
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr2380202185a.55.1771490444506;
        Thu, 19 Feb 2026 00:40:44 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr2380200485a.55.1771490444035;
        Thu, 19 Feb 2026 00:40:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56314fsm5031890e87.17.2026.02.19.00.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 00:40:43 -0800 (PST)
Date: Thu, 19 Feb 2026 10:40:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: msm8998: Drop redundant VSYNC pin
 state
Message-ID: <6i2i3cymyu2oj33ltlosgfysjlgbv5vm4g5fi7ukc2ctzgts4f@cyn734szobpv>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-2-2799b8a4184e@oss.qualcomm.com>
 <667woowm4dcbsmce6lds7jk3r4b2efs6kk5rkjtotkzsc6grzh@ps3uf6wrzq3w>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <667woowm4dcbsmce6lds7jk3r4b2efs6kk5rkjtotkzsc6grzh@ps3uf6wrzq3w>
X-Proofpoint-GUID: Sgjl0hcjppwZtSihBb7nIjoFsHTeCtg3
X-Authority-Analysis: v=2.4 cv=JrL8bc4C c=1 sm=1 tr=0 ts=6996cc8d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=KjmhrmC3ojnh0OoPlMsA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA3OSBTYWx0ZWRfXzMXSEA1KR6Ni
 Fq/Cz+lNSHlZHZwyDqK0SlnFa2YMioyTQct6Kc/mzQslXHvy9UjCWZXuHGoQKpaDr76r+Iw5ftS
 yfUPd/SHbXBytEjPnEZXyrlJuPZVlcKDN5xRCoqc7z1Oq/pE+Z45wC2/KQaVgZvqlRasUb+/Dby
 x4qS92wsizuxQG8zxdfMVf89qLDXXenrvdG/4WwuS0ZBDPMoVPIJzCyftPszQVovIjH7z+tO5l/
 e5lT9N+pTegLrCCpgDgRoGvzxTrP7Ims8QgTNr8PISYFXkZh6rLj5RvLga9+bmhHNevTabJmjkh
 qIeVxD7R58nX0dNd+SzsEkd51CkZJxY3a98LtuD/Uq4MzZFuieJwCYTQG36qPeG69myF+L6NFTs
 PMRlKSBG2uXguxilKPr8qTBfJjiaMW68q8N/OG8Y9Sz72Z+aVBF6vDmgwrFxHN5j0SDHalXrYZF
 l7iM3ze+yC29qB3B4iQ==
X-Proofpoint-ORIG-GUID: Sgjl0hcjppwZtSihBb7nIjoFsHTeCtg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93346-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2595D15D16E
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 08:51:38AM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 18, 2026 at 06:24:24PM +0100, Krzysztof Kozlowski wrote:
> > The active and suspend pin state of VSYNC is exactly the same, so just
> > use one node for both states.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> > index 0cac06f25a77..30222f6608da 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> > +++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
> > @@ -543,14 +543,7 @@ mdss_dsi_suspend_state: mdss-dsi-suspend-state {
> >  		bias-pull-down;
> >  	};
> >  
> > -	mdss_te_active_state: mdss-te-active-state {
> > -		pins = "gpio10";
> > -		function = "mdp_vsync_a";
> > -		drive-strength = <2>;
> > -		bias-pull-down;
> > -	};
> > -
> > -	mdss_te_suspend_state: mdss-te-suspend-state {
> > +	mdss_te_state: mdss-te-state {
> 
> Seems also to be unused. Can we drop it?

With the same "can be used later" approach:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> >  		pins = "gpio10";
> >  		function = "mdp_vsync_a";
> >  		drive-strength = <2>;
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

