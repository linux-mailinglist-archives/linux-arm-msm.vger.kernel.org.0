Return-Path: <linux-arm-msm+bounces-95716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPUgDox6qmkqSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:56:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5A21C347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 07:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FAB3035A85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 06:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97123369992;
	Fri,  6 Mar 2026 06:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8CIa2v+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0eCpLL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068C36B05D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 06:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780168; cv=none; b=n5IAfGesHWoc3TDS6LEftg6WY6G0I83ryoEXGTCuAjw782N2858ZL30H+puzZAqAHjpVlevSVJ780ubK1UOvr5IVqGhJXOZjng5j/Ji2bje23vq5SvuyHYfPAxet6pnvMGSg80dw3Ix9yhBKV00nQjjYKCfq6iDA/2+2wUUwX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780168; c=relaxed/simple;
	bh=pnvGQd4DiBd4zlxeaf2yVz3+fboP9br320RdhvzEHdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uXJdi3ls8cEaz1JtXix/RCfOkEkQjcqfzUrU2Zd8G3J4p8oyvWSUfpddAurPQWLAMkGS+G8vc59CqrRr12FGz89kIlpCYiDBiUzGMKGZAKYhD1nBBobnySeHAk0dn9sITBN/R8vsPP2ueMWLbRt6QI18TMY+2d9lvpxjdJPYhjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8CIa2v+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0eCpLL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62654Q7T4193493
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 06:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ti+waHusplNvNnbcc5Rbca12EALs3LAYLE7ZMwSf2Oc=; b=l8CIa2v+srvh7IKF
	8se5HYn2L921St7q2QGO8fyu4W+fHWropv93dAV0cbsb37V1A5Q7NtffIzb1UT2L
	myEqLmB0CUBzEoiYvU5ZXawvPONNlNesZd4C/0z+PuV979VB4QA6xt5OBuHSbszB
	n6KiYju6M/NfzvuaIcb+QbDz1pki82qlbQoaFYAY/kaNYhQMX6NB7aUXJVOL3p2s
	ZOP36IoMgcetd6cZdlzQ4D9s/veXT6c5WDsrtt3T4c85W9gffgyUHbZ72JSBFN0A
	CjyvprMA4+mRLr9of8rbsqh3xLlFu8i0/y17v4F+r9KkVLgIlPxGkzf5YIgHMUg3
	JRh1GA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5rbka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:56:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae50463d18so48872865ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 22:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772780165; x=1773384965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ti+waHusplNvNnbcc5Rbca12EALs3LAYLE7ZMwSf2Oc=;
        b=K0eCpLL23R+4l6ES/ZByAA/4hXpdUgJsm1PnNk2RKXvlg2lt3YBJoIcONKLrT1qyi8
         jlzXQ3XB7m5bk90adLKIwJk+WzdtqzczmwzTxTNVw/hE511HsTCEDXB4kbuNnOXBWV13
         4WIaXrAwJK0dupgrjZjKGvnypAB9abNAlimjchnJ7ctlMSXnjqUr4wdu19I1r1VWGxbP
         +9Dmmz/NNFDRzrlokzR/M+bzUNOj0t6sXFHf30UlaV6Ge8oZ9EFHuABmkCjbni2m4hWt
         2tzzgRM8wgQMw6kEaMALtKhAkXskgC/6GKzLfAy78rKbsG6SLCNvCoS8Whr8T83bIxvi
         QoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780165; x=1773384965;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ti+waHusplNvNnbcc5Rbca12EALs3LAYLE7ZMwSf2Oc=;
        b=OLgnYvGOMivQTpZF4EQUb+r8vq4QYYW3sssy+Y8L672V2SzPuEW82lQUsJXl6bFTgp
         JUXy69uwYL35f8AQnmzg2qQNMgwXEXDH/ewl2vlHO2Kp2/tR94Lxn1BXrbPRrnzJUDri
         +3KeOz6bLYcKJuAIaU8EDX13QUy4WauGT4jwi5LOY/jHUdmLbqmiRAiqmTx+uTm4Q/zu
         h/YKBv6/0HILxmVsZFp3VSzwbkKWy+GUZSnNQnB8ciNqmtwRUMxPeLlr+v19NiCW/bgz
         DXwFIYjBymwgH4XAREWN3ocfKtd4laO2cnIY7CSa05ktewhSjXu+sTu028/IYgrtDjQE
         bD/g==
X-Forwarded-Encrypted: i=1; AJvYcCU29VTvrkxrr1e5oE5Hi6+poPix5eT9ONIyM1j463QBaBo4LqeJ8falyolWDCnBE8PXcBVPmaSrhLNu6hGl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzko/4dAJ9lCcqFtXDMy42JcH7FUHze6CuVDgdQlnnJ0XHrvFhl
	pLz9OqYb+g2XgqF8H+nQzLvyE7us0yMgs7vDI9ot/lrLlVJs0uaY1n21luVrQY+AUvRQQqoJVG4
	ktEdTCk0T/UNRnZpQMuXKewBZhIcNeC2JSdmsd4TnNfcng4K4+gc3Y8linBcL5ukiOa+G
X-Gm-Gg: ATEYQzxkSpg7aQcz7w2qAXwVMAml96HYS/PJx0RUM3fYpMWITBXPPyaAe5IdqmJSa8u
	cDlIBc0eTrX/ubyfdcIlWMTcPOX6drZZANxE/UOHvPMDCdpWtvtDFBWfyNfv/KkNoEs7oH/AJc8
	NKzbxvwf8g6zgMxcUaxp7Y2BDCWlKZ0y3Vd+peLhOWOpsqPMyRKcD4789vxyYxIlwI+yKchw4qJ
	gybZrl9T1Jdd3GL1s0fd2/CG2HimHjeJZprZddCot6hVh2pixDwYkbB7g1Sta4gwb9dFxktGzWK
	TIc738GH+z3f0p1pdP1SPuJSnBKNIRLzxKpEkKpC0ZjIY0jDRKYe8zD7rYH+NJxrNEh30ostIId
	7XOUgo/yWj6pGrf/YfAW+OHwFSdy0ctVFbfMKc+5rqsAWOg==
X-Received: by 2002:a17:903:2983:b0:2ae:5350:3a4e with SMTP id d9443c01a7336-2ae829f3447mr12056975ad.21.1772780165192;
        Thu, 05 Mar 2026 22:56:05 -0800 (PST)
X-Received: by 2002:a17:903:2983:b0:2ae:5350:3a4e with SMTP id d9443c01a7336-2ae829f3447mr12056715ad.21.1772780164684;
        Thu, 05 Mar 2026 22:56:04 -0800 (PST)
Received: from [192.168.1.11] ([106.222.228.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83ea69adsm11963295ad.37.2026.03.05.22.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 22:56:04 -0800 (PST)
Message-ID: <dd14f8dd-254d-42a8-944d-f667153bea12@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 12:25:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add Kaanapali compatible
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260305-knp-qfprom-binding-v1-1-1b3effb09cad@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kmb932l81rVz5ja-x_y8GN7ahinZo19Y
X-Proofpoint-GUID: kmb932l81rVz5ja-x_y8GN7ahinZo19Y
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aa7a86 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=uL+hpB4jSAN/g3a/thif0w==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bMeJC1LCwUUxvMwXMs8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA2NSBTYWx0ZWRfX3cHY+r5pJ6BG
 E7S2IMqg9l8YpJVrZDKVy+YN9HAjX/zAU8uM/KEeV82DBEUflCWcmiNJbf0WJ9AoKaHX6QHKlBI
 1bgjA/Ffpn80CyVjF8oR6krS0uuCNJvSO32qSQ5eZ7cBLEb/E69rMQ3fIYnw8njcb1ef2CdfKAp
 cZ+8xnjrB0Yram4PT3FrwcHGMxxJAYj3vIVycTgt4lmpz03oW/2Q/2iL4ifzFCIwRfmt73fD80g
 IBgL8Q1q4u6iQYcPPT7yYJ6QIN5IkdSuV3OYIEobXlMh+xFmxZxQtZtL0muR1qfGCrfO9Vd8Ajm
 cmV9YDQEkugS8SwhamkuRQmU81SJgdkDXveAwxEGOxvfZT0dHfhgAPz68io5kyK6csfBOv5AlFh
 X6bTXZlduZrdWp02/x0eAUrkROuv1El+VBVXYTSSYjdQyif7LzwscF0yzeR0N+RqQfxQgHsVRJt
 3P/hfGWOMuEbKGVASmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060065
X-Rspamd-Queue-Id: D4C5A21C347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95716-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/6/2026 12:10 PM, Jingyi Wang wrote:
> Document compatible string for the QFPROM on Kaanapali platform.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 839513d4b499..2ab047f2bb69 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -26,6 +26,7 @@ properties:
>            - qcom,ipq8064-qfprom
>            - qcom,ipq8074-qfprom
>            - qcom,ipq9574-qfprom
> +          - qcom,kaanapali-qfprom

A question to the maintainers.

Do we need a new compatible for every chipset? If there are no KMD
facing differences in the HW, can we use an existing compatible string,
like sm8750's in this case?

The fuse definitions (which map to nvmem cells) will obviously differ
between chipsets, but I am not sure if this alone warrants introducing a
new compatible string.

-Akhil.

>            - qcom,msm8226-qfprom
>            - qcom,msm8916-qfprom
>            - qcom,msm8917-qfprom
> 
> ---
> base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
> change-id: 20260305-knp-qfprom-binding-efcff6ea9b7c
> 
> Best regards,


