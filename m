Return-Path: <linux-arm-msm+bounces-101037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDNEFCGsy2kpKAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:12:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B119B3688FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 13:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F2143072D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E273A7829;
	Tue, 31 Mar 2026 11:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iL753jOi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="caM/gcri"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BCE3A9DA0
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955387; cv=none; b=jisTkdIuoovHJdKGZp/NR/CJeTYetRwhtmp4mC+oaC5sldCwr8RJzAzEnQ1FadZ11huxR4JH75ogj7igvBkA1GHQD4ILyFOfCoj9sZxbKEsD3kaWrUsGSBDgwbBhE3TPiTRZfnKMCjn5kSpgvkfvSf+MK7LZI7q0XnJpPWYU7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955387; c=relaxed/simple;
	bh=YX4YeoXUQj4rirf0ZDxTIVRJgQZIJ91d0BJ/Hzx+brA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECd9Ddcy9yi3SN1ksbOO7He8iq77apZ86J1sZULWCtM9Xne7TJF4H5pzKVOuHAtYTV8dB7GLJOdYO4Fn698rAMhb3pBiBltdnx40BLjp9LQm5P0r24rKv7K+yMnMxU2iiQboIF3YUBu6iL+HKqkG8GWjGvEe731MyiYGuUiwGmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iL753jOi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=caM/gcri; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VA3Xn24053489
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9k29WUXpNe4XtMNJRbs87y7z
	zVmykpGqEVD5gYnbM1Y=; b=iL753jOiGK3qBwhmXky2oeJe68xYqJT/NAdIQfe3
	WKHuvxHVuG39HBz4yFoXQNfVEoAE/jJNgkY9ugEqCqjKyVAXt59O07jxfaIe5oj4
	8Q9Xum4yYJLOrofaUWXUrhUzQdxYAe0b9NqJ3TSy/REQ7pLk2ekbLfXkQsFT49Ny
	4Kx/uNgyRl5LPIV0wBxdY4/GjGadcVIpHoIkZEOrON0Y4SbtBaTDiOAY2lFNpNbA
	AwMX5eCrXbZGdPEKtkxmjYqK0fKyRcEItbttAPYRU+u3ayez7haihlyzKf/rb4PV
	IcPTEyu/4OggYJivMBCz/FKgMb/UtqAdhJaOpmIeyKih6w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3b8au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:09:44 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c72849f648so4553781eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774955384; x=1775560184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9k29WUXpNe4XtMNJRbs87y7zzVmykpGqEVD5gYnbM1Y=;
        b=caM/gcriYox/wnZfCrvsoMFS4lIcwqOkzvMx2JfOkPxnx0c0e0RHfD3WnOlVEjIww9
         V4jmUQtRSwuzZZYHnBEHq17UGpeTHenmG46OshUk9Q4q/2ECoIb5rQa6J5wYdnEwcOI2
         IDPjU0eiD4iV8AJtWheJQ0VoN4QTqpYZVkpnIMs8wh/pwR7sjbkLkFiFD4GEy2TW3G5k
         EyxomZs0Z3Iy8iMr2kxdogyiXJAON16X5TOXqYgmrCxY/9f3iB9pVHQPMdQ4pxjNOzpx
         ayHCzko6xojUie9Vx3PW8UiGJcuGKKoRVuT6MYFA8JaW+0uIU3+FbGA3bYszsCD0/nkz
         doLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955384; x=1775560184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9k29WUXpNe4XtMNJRbs87y7zzVmykpGqEVD5gYnbM1Y=;
        b=WIMMfpt3YRlCDlG2DaD3lQNS91iJavnon7uPCRIoEgTNQHJLWB3qckJsK5zvBWNqXO
         Puk2oD2tQ2RJVXOH1PR0bdbyF1BlwLGeJrMhHGH1BiBB1bMJnKUS474ytbD3o4Nbds/u
         r7SqVoVBLXEPsGYnDc+43wwAsG5t8LNmKuIfMPj4L/9piP7DPzm4hHblQ5Cx48LUENHd
         1PBMlxXBZF+68LgVbEiNuIHnnH/0CWEXNgAzBkWWcIHqOWdrSXu948AGtXPCmTMb0Rwq
         pnh60D08JRdZ68u8JLCQspDVAEvanS4lyVEZtYdT5qPZkY2cU1gqJDzrCIc+zQX/WO23
         ITrA==
X-Forwarded-Encrypted: i=1; AJvYcCW9cAvH58REOQnAx5VsHkb1MUCv5PYkH2p8wVoW4oikLtit1+Tj/d7Xyq9CwuiFL2jPiVHX3W5uD5XWWaQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/yTNSPeJMcJ/FWkbgMwEaekV/ycYgvg6IkXzQx0H1faCBe6fy
	0Pj+N97XWIb0U/3MzTJ9VU9Se1GuhCEwAmo95/KMVJHQMBhz36pMN6UVE94X0qgt/U+pFV/v5ZC
	M/3+b/4yTAiwxgqMnLlN+DrlMhuAPZnhjyKvej6MCw07eopRJulHouCSO0wee6kXFCjTN
X-Gm-Gg: ATEYQzy/xeqXW9IAo8h4SKluF0OIyeHsFwfkOtN5pIizVxfllKvzHtCXo6i8DaPR0fh
	Fp4jSc/wHnu40OSGo97KYh4HBs4YmBWhH9dC1RVgNgYTUUv+OdrFOcm4L57gZJjSgF1C91Tw8a+
	zdDFG+PmU9tgHevcmPgzzgqTvpqTnsEpiKZA+L1c4rweDJg7m7Uvpr0y/9pB4Gh2emuJYV5Dxfw
	JEWyQs40ajiq4pU70U5W9jXRdtkupHwWhjsDnEAMPrwj7/qX4QpWLy+wRzgKhiduQsNY8NU09Z+
	JvmKB7d2x/uLE3KvR53igl/iauPCz1leHkNXF7r3itsErpSOR/pwcKwgOf2UXoXk82AmnGSt4dN
	U3pHrWWsj8bz28tGJGqqkClGpLU9v3dqK/PcflwU1wT/QSLuznXkwD7p6IhEVnHsw7umK0DE=
X-Received: by 2002:a05:7300:6423:b0:2b8:c1b4:9cb7 with SMTP id 5a478bee46e88-2c185dfe8c4mr9580057eec.22.1774955384149;
        Tue, 31 Mar 2026 04:09:44 -0700 (PDT)
X-Received: by 2002:a05:7300:6423:b0:2b8:c1b4:9cb7 with SMTP id 5a478bee46e88-2c185dfe8c4mr9580042eec.22.1774955383612;
        Tue, 31 Mar 2026 04:09:43 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm10518512eec.31.2026.03.31.04.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:09:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 04:09:41 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: sram: document glymur as compatible
Message-ID: <acurdc3YBb6w2huc@hu-anancv-lv.qualcomm.com>
References: <20260327-glymur-imem-v4-0-8fe0f20ad9fd@oss.qualcomm.com>
 <20260327-glymur-imem-v4-1-8fe0f20ad9fd@oss.qualcomm.com>
 <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <t5vbe36b3i2lx4ktrw5bosjtldgpmep4ueqkx5b5saoc7a3dm4@ywsv5rrcefew>
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbab78 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=U24DiTx__9Z7KcXm8yYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: sfQySmcOQY69NAJJbO6pJvyYHppZV-yu
X-Proofpoint-GUID: sfQySmcOQY69NAJJbO6pJvyYHppZV-yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEwNyBTYWx0ZWRfX9GETyFTrbH95
 mk7Y2cjffAIgVhPuT26vehWT/GnnKmJzM3FwHPKnvW/pixUsD2tzY4oIxzNp1hVVXT67CU3whWB
 kPhsrRw+HoV2clw0mOe/SFGuP2LZZXFdySvgkStMJUvWBob2TIL+AAPWRWS5zYSECQao3HSJCTL
 ZCMY9ofScmgIiuLN/AZy7tSxqQWIPwhtiFfoyZQH9Q2xHp6BkEPUJXHQ8+0gPNYCUKhH0rMaKru
 5e/kjnF9g+hXnxCZS86mzVHlkqB+cysNFxlmjUKp2EDmr3EGlHfrx9F/O6XtqtUV98N+jt6mRJ+
 wJnkQ1yYIYEXCyKS5P2hWshqSOyi0bIjq4gKl41uCt7zuAbY+U1xHcTQOkBTeH+TcuAVHAEGiK+
 YPVwEheMsTJr2QrTU1Gs02DFO514y9+h39yCKuika5XQ651jnXZ2a6OgmQ0RlcyRozZlKp+dp6U
 U83H8UIOOST+g2VZO9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101037-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B119B3688FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 02:05:23PM +0300, Dmitry Baryshkov wrote:
> On Fri, Mar 27, 2026 at 03:24:35AM -0700, Ananthu C V wrote:
> > Add compatible for Qualcomm's glymur IMEM, a block of sram which
> > can fall back to mmio-sram.
> > 
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/sram/sram.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
> > index c451140962c8..bd62711dc630 100644
> > --- a/Documentation/devicetree/bindings/sram/sram.yaml
> > +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> > @@ -34,6 +34,7 @@ properties:
> >          - nvidia,tegra186-sysram
> >          - nvidia,tegra194-sysram
> >          - nvidia,tegra234-sysram
> > +        - qcom,glymur-imem
> 
> Is it different from the Kaanapali one?

No, it is the same as the kaanapali imem.

> >          - qcom,kaanapali-imem
> >          - qcom,rpm-msg-ram
> >          - rockchip,rk3288-pmu-sram
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> With best wishes
> Dmitry

Best,
Ananthu

