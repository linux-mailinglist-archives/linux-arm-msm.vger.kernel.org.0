Return-Path: <linux-arm-msm+bounces-85900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE6ACD03DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0246C3037C3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58625213254;
	Fri, 19 Dec 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RdrwGOxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgl2vcGu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4042158535
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154169; cv=none; b=LaWU1/qFlyUPvJWO9y/Bf+MpIxFju6EO8Iyi8VCtHt0GGfIqCcwL3OvA0q8BKa5x72T1OW4njRqD9LW4DYB34WbeAVcOxFbJWSAPnloOoW02R6jM1ZklmkejEGYI4V7fvV4PFSILhZmPu87/HlMzQxFlb1bbrst+AxMr9r2lMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154169; c=relaxed/simple;
	bh=rMPeP7cKewbJYaRXHJ9LTGVVwPU7cSSIGeM5jtItnjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxqG888aK4WMxL8hzLQMB/OEYdbdM4MQRNdXpjFWMH8qxjuTh//JoAhS5Cu4YgZqpkfx/IWIqGucWfOXC7znX4cd9/QojnDi9U1YnzaRjuAzJ6KTCQZCApAU30ycaxstqZH7xRSt9Wls7aiL5D7iEwD1gHR7UMdoQYW87xKec1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RdrwGOxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgl2vcGu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJAvHHg3559188
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7pvWsuXQJELObmI7x+PxidH
	a3S4nPSltcnRxt3AMN4=; b=RdrwGOxTS92vQXL0XzrALWtnwY8pkkTyD1hI9eHE
	+7JCyee5iA9Qn2lDpMA7n85oHBQyrA1kroUKu/keq1FrRENStGJdqffMCBkIc+db
	7F6rzWa7Tlovnz0Uajd8RD8ljnNKrqRBTylx7edBPZtJwlFQwn85dcwN6fBQ3xYq
	ic872HuUGGjnrNkaBYkBioEK3K97AYNevtK4OXb2lRlM9yhlT7aLlC+peUa2sb8G
	/TSO9rIvWmp5OES8C5ngKEfl6yR/NDQiziFnY/iyp8EogQNb3ZZGhC1qTEdWATrC
	ReY5lZPLen2JL0tpSJ701hWF4EB6iwsfV7rQ9MEK09yupA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cay09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:22:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a316ddbacso41431226d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154165; x=1766758965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7pvWsuXQJELObmI7x+PxidHa3S4nPSltcnRxt3AMN4=;
        b=jgl2vcGu0ILPcto2RWYKnGSnxufROmXNIBK2wPkH4E24tvceJqkrtVRRT6wdaU5i/x
         LEEI+kavmmGL1OHsyky/Yi//W/hB8E2ZsrTwQOauGvTZis+sRDxTnU0roQbIhjpxy0/8
         5Hkh5TD8xL6Nc1ObuPMbMZybb9nBm8pz//njodwS0RYu+K1GQCGBE3D9bIz1fUHaeVGD
         7FdvDzSAvRMoQ697COC1n7zNKnKJBCoDRp+XZp8b9YCJMbcmqHhLrq1c2v8vVEKO0ETU
         NKoAVicY/F8w9CUX8k8D8LAXCFn3Oc5UywFjWz/0Sz6rFleyb++MtydbYfrIZz5WJHj8
         J5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154165; x=1766758965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7pvWsuXQJELObmI7x+PxidHa3S4nPSltcnRxt3AMN4=;
        b=jRzQ9pHZyir8OyI+uqn8U9XU3YEHXMAJqE97NRUbGblI6oLhmPCdQVVGorOi4Kz/Fq
         th4WFQlSvkkk68v/U9qVqLKiiOjujRbUYQuugiOmLoETClzqlVGOp/VbxGkKa7IqBSRL
         3VlIyX1htDOcgnuJ8WVrunxzH3aPl1pdw5aHLzOzrMhu9GP4taO7cJBi4RLtSww+I+LP
         sETnWme5YFBoANXpYR3RVjUJd2wBZILqhbCP0+t+zxIiuwvjIhiXPTfx8AiI11UuHDr3
         Btjd7vYya7bs/CBqVgv1yPC6Q1Xsn3Krjkq8zd8lXins6Xxx23FAJDjcidMggRMZhfT7
         JZeg==
X-Forwarded-Encrypted: i=1; AJvYcCXIUomG7kaJr0q3yLLljQ/5IaqITAsTsfWlSpxFQRkKpV0TVkz2wymGpnC/dptgmiE/nDh7khiJFfBk8ZBS@vger.kernel.org
X-Gm-Message-State: AOJu0YxB5lUBJ1SAePFnqZDXbSKCsz8ozGxJP5ACRMUF02DPOeTtxre+
	7eAhPBmhrSc4KBj6vsFiREXXELWOsoQ6ZeB+0pQCGqDFMA9qe3J/yOvspwv8+bd25ysrmjVx6ah
	EI2d566TnT7Xcw0kN1tahrElcCYm5Z05TlwMCopb4X3PW1Uaq92AlDiJ1ukI/K3hRsbXO
X-Gm-Gg: AY/fxX6kUnaVoj1/jClt0ZZOdRi7wQAZ79KSE0j5n1YYuBt7bJeSN5hE8Tq1FMtmqiS
	va8Nxo/a9p5grf7ByxraH2/KKJ5mUARei4qy6pdH6yVBwW8A65e2NroObYPb2wbhWLO3/ZKt6qy
	m9Lw9TsLouyXqIEaK54tYqHQQKEX7Wgqx3o1P9FybOWEprJInH3vLLanfFMtRrqKHcfCoYvFI6U
	puo5rOXceIKDyX5YlH8uvZQHVbVlYw1OHJZeQa5IlyRi6f7XUR1RaP5/r16L/LxcI0XKLcjr2h+
	Bvda/tNms3L1bIarDcCv+J83c7ChMLszrsONXPjnqLDKaMdc18QhljuNGWAoGF4pxYrAdRXeM3q
	+psVMziWF13GLT8R0ceWPrXr0ZmYS6+3szMla1+Iz+r3ELEl6ViyAZGJ/22TGNXGwJkQQJfPiHG
	8fr++kuoF0hmjqm6jde/NXgEk=
X-Received: by 2002:ac8:6711:0:b0:4f1:b93d:fb5a with SMTP id d75a77b69052e-4f4b43de5dbmr9385831cf.7.1766154165031;
        Fri, 19 Dec 2025 06:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpIjNCeKhT5W85cgv+xOyI5yMUcQMZYD+21Fr3TzDVqSALOU0KA3phfoKOP4SKrKAH1vtQZw==
X-Received: by 2002:ac8:6711:0:b0:4f1:b93d:fb5a with SMTP id d75a77b69052e-4f4b43de5dbmr9385451cf.7.1766154164600;
        Fri, 19 Dec 2025 06:22:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd252sm722344e87.24.2025.12.19.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:22:43 -0800 (PST)
Date: Fri, 19 Dec 2025 16:22:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1-el2: Enable the APSS watchdog
Message-ID: <ti5ackdyyea2bzq4gyxdlbx4vksjqbrk645g4ebmkf24xgiu6d@rcdnewuwndc7>
References: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
 <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-3-fdfc6ba663e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-3-fdfc6ba663e6@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69455fb6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=YcuGliB_beCyQ2iCDSYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMCBTYWx0ZWRfX1o7ZeacmPb0Y
 okErcXL82HwGshXr0Mz3HByBHn66HUXTG1h13VZJ87I8Bac4h61B2tgnXS85VX/XIhHlZkB3OQj
 9QscIL5FiCwva0JO5AxHd8t9kU5nkiVPa9u7c8JbXup/5sjMz4G2Rn5hboocQ1a9KB70XAt4c/j
 I7nTS6E03PDIyrQyi33nf8sYIbUSRdwVaAOnMVv9ESJtLoeWP6cQfccTewnk9svscpMvGdF2otW
 cRlQVOb5Jz8jA7Jmaz4iJ7TrVEP1tJpyPkrn3GGTNnU6su8OYrdhId0io0VSFUX/oFpchQKr8sK
 ZqkUWZqnx2l9+SPTU90zhulfeHiwwCiqmhOCwLHk6FANh8m1y+pkmD7rmoxLafJ3Diy5EbmriGh
 q4iYxRtjh/QCSIKDYiEumkIVpx9CEgFce3nzD1Bx/VgP49FDJcGkxLLfuEbudwzqyRkfCv/1Crf
 7Tg27IuPBlnhiVhNprg==
X-Proofpoint-GUID: wzbrZX2gXYwO-IsD4WMLgXw6Db4FHxfQ
X-Proofpoint-ORIG-GUID: wzbrZX2gXYwO-IsD4WMLgXw6Db4FHxfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190120

On Fri, Dec 19, 2025 at 12:00:30PM +0200, Abel Vesa wrote:
> In EL2, the APSS watchdog is available. So enable it in the overlay.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-el2.dtso | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

