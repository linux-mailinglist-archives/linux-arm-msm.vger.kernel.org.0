Return-Path: <linux-arm-msm+bounces-86290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EA8CD84D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 07:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50BEF300215E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 06:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFF0301704;
	Tue, 23 Dec 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ozAyN51G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GnBvhl0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3EC2F6927
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766473050; cv=none; b=r7lZOCfgMXmfn96QnPe3/KZflqJkcOJ82Uy7ImUkVAAY4AZj+HVRQoILkasj1PXGEAFxku4ogYNhOlPM4cS0G2nr1DQ9qNwAOCJa2jwqKUgAsI97Z1nigDsGRlKLj+lZATxerGiUQ6v2dh160CQIP2YePhmxzbFeB9sIt6U8KOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766473050; c=relaxed/simple;
	bh=KThyX4nPO3vwi0+H838Sf01Df1D1wwlwyQZCv66F//M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7gMZnUQJnDne1THpeSnz5ui24spps0BS3jZkI6NTbA07BvY2gkDIvImTAablNtRdGuSfJq8lKnib2vL/cR3nM/m4qFOoQAha+MGXqIwoVdn7TJ35b+/0ISvx0eLCSrKEAZE056Lap1g2CWTcPt2Ojo/SfWNy0dZtVShRuIOqMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ozAyN51G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GnBvhl0n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMKEKpn2116415
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H/WmUMHRKkdLejIUbo40s3wA
	GGdStqkFQIeDkcgbqKc=; b=ozAyN51G6ApnVB/sNRtoPgGGHkR+U5BZr7rGKCQJ
	yn/2gbGPvVEeeb99wAaEc33wwUEH67dCwEicY5AGRuIZTsMjtcz93fP8pPMNmRAO
	Y9M1rHtjqqcmvnXVxXiWc3+9OdIJ5qZm0SzHSVbkQw3y0BJbNJFIqcAe/0B2q0Fy
	rdbI4QIdCVSl9zxfvxhQRdt7a4oqgfWxgc7UQdC4ppDa6mO0ayVdYSlCEKRzhie0
	vHw4ZXkXIgqTwb/H8qUsH5lyYota4FcK52/WYikFetvNhl/sYWpJ8lw3VhXhjqj3
	rYPq0CR0i49TMuWjZH+gYzUg/GKo1OCbXpSDkfb/YY1Uhg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudhmyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 06:57:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7f66686710fso8996640b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 22:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766473048; x=1767077848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/WmUMHRKkdLejIUbo40s3wAGGdStqkFQIeDkcgbqKc=;
        b=GnBvhl0n48ViT0mhi6CcZnQGgSXGh/aYYQMsrlo3DlAOKmnTvzlBhT2yuVECx/WVox
         fQ3uUx2OfmAwQ2lDLSQab9/1j4slF8mdnIpNC7kvuizRTvqpmXMSF/RZ6lyEW3enGJUR
         cNMABDvspsh8ADsil2WgXBcbpnMciQax1AYu1A1vAkR4lFq4jQMWd8kdDZodv5/Vwl7X
         GJTmE7qeNUgHvcee+OQCOrERjxI4wF+vv644wDUBhQDX7DTzvvpBOM5kpuvSClrDaN6T
         3PeyRFPba1gC+fiWeZCyQRb26u8+0tU4bauexV+/S5PB4Zx9yMLWuYulCJiQK4OqAMeq
         eW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766473048; x=1767077848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/WmUMHRKkdLejIUbo40s3wAGGdStqkFQIeDkcgbqKc=;
        b=lX2SUYz1RPjDnGm/N1EDD4r3o1Ksf4BCkVDgnY9wMpA3Y4KNfCPmZXGsLIF8gPgS7R
         kBx6F/+zbyhE92nEfbcCsiIvCsZKmoQOQgjMzXjsvaZP761rB4jn7ecn6aP+8B3VZuKr
         m5tKezpfY8sqNu8etEnKqz1gWJjhjyt191NVpyKjuEGoBZZ7tHOXBlmZTEBf62o8ILbi
         aajcQ30VAovTtHjny23Cpkg3vxqhDW0AzPeZJHcufT+HLzufcXnUQG2uBuCLLN5aXf22
         3yT8f6rxBn9fJOx/kMGlGYJeVrD2zOUZPl6M3Hi8nHy5r3HibQKCCozXM+f3v3YnHYFd
         +6yw==
X-Forwarded-Encrypted: i=1; AJvYcCXRnrbCNPIeZe6/kMh1XnaePoSjUAEHt0GhCs7RTODg+j+3mtOL3ihAal0xlRWR10O/1sjHHW26iQsRorb8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oK8xulDqp+klcClPCv7+bzOXT+B7yj/Zx48+hkeoT5rOItuy
	iKhYPTg8hqBBOVOSwGBzppgh8JsVWNGlkeQfCodM7NqSbgy+iEW1ymtUujmfobryVfbu/LtmKI7
	l+vGM9iJdGaIJMn0Ju9aQJ8bprNBbp2HopEO+iojjtwpSNnrGD4nPcgila+VCNV3udQO0
X-Gm-Gg: AY/fxX5HcULpxlZnClawG/v1QR5Ju9BfEjS3+J5oIi65aqDGiocfKRRHXjkMx3rg3XF
	cflkskBzqaDh4HAPT2Zb+yOiebRy7Nb+GbU7XsPQPniYqt096DsOEypc/Ezf00v1NhYahOSZe1y
	wMq+tV9N+OnR4SEolNPeoh8AGZDKaSQl/Pkm+9GCOSxkcNkDnTCf/5TUGGpprwKe9XrNKGIDqPS
	K/YURDyLjGzFBy6AxxVLIG72lPXRAt6C2vX2OmsyQtSEsiZG8KsAj4BaznXPyQG5M5idLJUEByb
	5Wbxyn0ty4MbRKa/ukavNEHqkSca4WcXQyqp1ferwvAzgSxz4sVkPV+FOmPXa0OuvD/IEvlwT6f
	QKOOAgz39NvDc+RArqvI/7F5RKCyHPdMMQZS4yHMXE6hda4o=
X-Received: by 2002:a05:6a00:ab0d:b0:7e8:450c:6195 with SMTP id d2e1a72fcca58-7ff66479a6bmr11612247b3a.44.1766473047981;
        Mon, 22 Dec 2025 22:57:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn/x+Z9F53fOihdDv/H36Uh2d/ccZWFW9KwHQ0K68aisaKryWeicwNiu26pfoymzYspMkVSg==
X-Received: by 2002:a05:6a00:ab0d:b0:7e8:450c:6195 with SMTP id d2e1a72fcca58-7ff66479a6bmr11612230b3a.44.1766473047557;
        Mon, 22 Dec 2025 22:57:27 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af2b537sm12487623b3a.20.2025.12.22.22.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:57:27 -0800 (PST)
Date: Tue, 23 Dec 2025 12:27:22 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco: add QCrypto node
Message-ID: <aUo9Uh2CxRvxxE2d@hu-arakshit-hyd.qualcomm.com>
References: <20251222-enable-qualcomm-crypto-engine-for-monaco-v1-1-06741d6ea66a@oss.qualcomm.com>
 <sbfaknkaha6hb7wl5vceyswkdz4ptsay3aw3evwcgjtfpto7am@v5ezpvy2xuj6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sbfaknkaha6hb7wl5vceyswkdz4ptsay3aw3evwcgjtfpto7am@v5ezpvy2xuj6>
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a3d58 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=N-RZRtAeA9jCEb56goQA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: XF1ABYaqkfVw5mUUayJTNwYBeCsTHZ43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1NyBTYWx0ZWRfX5fA1wZHzq6mj
 5Z/w6bgIbEJH84TsCs4m1echUYtxHhxpiZuhFBbpHUmfV7Ci+gLq1i9pTDPMsdtDPL7StvEzC1u
 rf360Hy7w0gHvl7svc17qlKjEZAH1yFqWuMhp5IRKcmfy1RZhwE368wmMUBB5iXcYru4Y+CKVhU
 EZC/hKYDuGVwCnGRw6JhlCIj+J8smOTPl+aSR75WkkeUaUyIAeknDGsHAUdsWTKxijx46r6fsAU
 mzqgH+e1GW28J62RftH6456R3zH/53s4MFnOZ0/NmlNC8u6+ltuC99m6bRCLDs3SFUzJpeG01s9
 Lz92Vwlo1b6gC5aP8NJe1SpEVJw3OWIjayudhkmS7NSIaeBO61XOTaJZWtyFBaacMXyJ3iMcGZF
 aK4DdK9MO9EeXMZp4rkYamK2qA2d6Q3ARKBpxE6IqY1C9cPg7xWzJgw7ZIjUmiUh7SyNY9JWsdX
 t4h/Z2V0kZ3CPXvsEtA==
X-Proofpoint-ORIG-GUID: XF1ABYaqkfVw5mUUayJTNwYBeCsTHZ43
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230057

On Mon, Dec 22, 2025 at 11:29:06AM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 22, 2025 at 01:00:19PM +0530, Abhinaba Rakshit wrote:
> > Add Qualcomm Crypto Engine device node for Monaco platform.
> > Bindings and Crypto DMA nodes for the same platform is already
> > present in the tree.
> > 
> > QCE and Crypto DMA nodes patch was applied as part of the
> > commit a86d84409947 ("arm64: dts: qcom: qcs8300: add QCrypto nodes"),
> > however was reverted due to compatible string being miss-matched
> > against schema.
> > 
> > Resubmitting the enablement of QCE device node for monaco platform
> > with compatible-string being aligned with qcom-qce schema.
> 
> This part will not make any sense in the commit message, once the
> patch gets applied.
> 
> Please put it under the three dashes at the end of the commit message,
> after the SoB (or into the b4's cover letter, it will also be properly
> included here). Or, better, rephrase it in a way that makes sense for
> the applied patch.

Sure, will move this description to b4's cover-letter and update in patchset v2.

> 
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> 
> With the commit message fixed:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

Thank you

Abhinaba Rakshit

