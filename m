Return-Path: <linux-arm-msm+bounces-63192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB3AEF5A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70CCD4A0D7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C166B26B740;
	Tue,  1 Jul 2025 10:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9WCRPNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F96A51022
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367204; cv=none; b=X7PuXYCEYUN+nNdzx8Nrqe9Pfunz0W1PU6l0wYQh+CkA4bRweujkuLyj7iENufjxBYYoxun6t9GypPQhNnullOPNdl0vKnyqkYfl88WyZ7rYN47q2UphslNIDs3t0grDO8Sut4gSIwMFGZNGApGjBOrl523fPN7WBBAig/mmsic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367204; c=relaxed/simple;
	bh=joA1eh4bQwcVS8h/KDAgRVDT/6KvsS0SR9c6ySZiuwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q7Dm8P7cIgj6+A0farBhA4Vjx+RPKYv8QmYcZXt+GBhnLKTNUh8Ze4F+sBeAgdA/AnaQ6xc+/v8MjRhM/34r+64P5cbWQBjO5vg+i/TkBmfjv8QgsvSNjBDd+4O4lAy0WZeG/NPkEoy101ULCkhFwxWiRuoGlrZcIWQAJriur8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9WCRPNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561ABUnM032116
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 10:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mZPBYxrtQdOrEqq8pmWOEhqiMtINa7r1itDL7uE0VUs=; b=P9WCRPNLyjhvEf2n
	mmUmn+bc8vrRYlzHutpMUWnU+8kKw7arBEal53L/JXUQVOIusMcZxxxeef7F87zZ
	EOkCSlLwPjVdh5EH6UrHq2S016JjMcGue/uXusLnEacZ2fIvDNzZVtE7FtRXeMgF
	x0f6DFpjJfyoF4lJvSchkCNT+Us8hrAa2KfYsuS/y3IixtPMbChVhg2SmJDzD1tp
	/e1EI/5Ea/gQdnlR5IxWqadKukvWLCNaz20XIXqmyku814KLnL0jSSx7bkuiP6BI
	sz++zioeMDZU1y+fUHp+hwVvUC8vDN2h1HExn3BdnQnXCUkWHQxRjF//6lhUBuLL
	+Lx30A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k8na1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:53:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fd5e07066eso8453956d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367201; x=1751972001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZPBYxrtQdOrEqq8pmWOEhqiMtINa7r1itDL7uE0VUs=;
        b=QA942IcPaM6XBiue7vDRuS3m59rbF2jYKLkxXRs/P87Bgn2VCsCoOhJkBqyNX7S4PD
         owyWIPgxEGP5LJsmwx1jjbO3zGVjl4O3JEgOS3naGgqBzg3yMypT3mIke6w1BDcd05IQ
         cJIbwL6xJ0qv0tY0xnn2wZsmVCeaqGb/f05pwBT/Y7phrLTpKuTVryi7P8lOqh3fZnuD
         b2zXx5jgYroMuTusHYjwZbli100/kFJFLAzhFgxkxoquwN89N/lY/ySPqzBUGZlyZ8dT
         wjnbAZXF3rZL+yv4IxweKI/o9cdVrFJmLROakk2xgOc6tu8VNCNEPotMbI78Pz2zhsQA
         FtUA==
X-Forwarded-Encrypted: i=1; AJvYcCVixIZa6rSDxVU0h45wns8ALG1U9vgAZ6L4RFJCBoKYmxNmDHCfwHfGai/IFBnQhqXjBxHBHOyDQnlBFm1M@vger.kernel.org
X-Gm-Message-State: AOJu0YxQXNRn8R+hOvLA2lkhy8KMULQrxhjKCcdFjBVFwrkuVHdR+XYC
	lDNwTFzw1A/XAPaILnmogIk9H6f2c3/KlPCHW8E012rFNcl8a4rjSgJfJr28PkakEW96XKdPAB7
	NF2uUzu78zziRgtzzXTC1ZTwadwMZoko0Ly3lnMOh6YIdBdugrQxtFyXNj8a9CJC7MnHY
X-Gm-Gg: ASbGncsvYlqFg0X+bf8C6mnJsr1HJr9pQEqF6M6Uq16wMy/mlfRZsri2eqehj+B7cmB
	r68iuWAgS+wmBzYAmZ6j1JyIIGSdfpZffLP1OUzSHL1GP+974jnuqLK8OQ4ho6/UR7axO7f/AiG
	ds0+io6jWDm8nHhHw77VonznaHamXwTnG5wUiE/+zCgG/t+5GVUW6MtalaYsM+p51Z+7yx0wEgA
	vkAnONUok6eSoxEdAwjtJhA9YE3fD1OXYDuIUtOaKbCr7b24WCiwNjZbeuLtGe7is+PJJ3ErZSv
	ZXoqE6ih4JE4ooxtjjX183NWHoGoZ5Sgo7LG1l3JVJlKKcQGzpYKbaDH7HEjpuAAmaZc52WRp8E
	db+VLVnAQ
X-Received: by 2002:a05:622a:34b:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a82fb2f746mr17034631cf.4.1751367201143;
        Tue, 01 Jul 2025 03:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGvMQQbpgZu6HTRT/Ygye0EH03aZTPwfzYQFJ2rhLYRICyS7XOyOcoKvtslyyiyzF7MlUlFw==
X-Received: by 2002:a05:622a:34b:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a82fb2f746mr17034501cf.4.1751367200717;
        Tue, 01 Jul 2025 03:53:20 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbd34sm7312209a12.9.2025.07.01.03.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:53:20 -0700 (PDT)
Message-ID: <8c4c791e-856f-4838-86d9-bfa2934aee41@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm670-google-sargo: Add front
 camera rotation/orientation
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <20250630225944.320755-12-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630225944.320755-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6863be22 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8
 a=JCdkjPdcWiFbGMzKlCMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfX+PNeo+IkG6UU
 Sggr3mb/5SReWHd/8M08sA/t2g3wXyTY36J9ZxMGxjmIC6wmMfR5nn0CrFTZrudPWnSBm3g+myu
 xydXyUqqT0by+8VFdWelBrF2s9JhFSl0zAy7WeKkG0T1iG0HGAAghRSPf+MuyM7zpy3S3+sxpp9
 nytROHSR7L/Yc+quE4gBc8N9mU5c5CYUs2EvxgcbIoBzPKPZadrFbjGv/IgLNZUOQcRNJQU8V6w
 INAH8MDm3QwxfID2Rb9b8g8ijv6iafHdYjp9umhQKMP61IwvCNbMnlF/tQ0+7ggMl1zqpdtSFpr
 rB3wToSYmBldlfrJJYajGE2PpkmHQHsccyjLpjBUcS+VM31Repsh3MSMpXR2dF5mtVxWW0b5ytv
 husahOjdbGSdwRVRyjkm3/GqH0OJd7UeftcZsWxwcXtyZP7/4FX8JuJd7ccHF2zHRWd8KB1A
X-Proofpoint-ORIG-GUID: qI0Z9YeZ6iZ0fW2mMuctrGoZKreT5ivF
X-Proofpoint-GUID: qI0Z9YeZ6iZ0fW2mMuctrGoZKreT5ivF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=831 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010066



On 01-Jul-25 00:59, Richard Acayan wrote:
> From: Robert Mader <robert.mader@collabora.com>
> 
> So it gets properly reported to clients like libcamera.
> 
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> [richard: rebase onto patch series]
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

It would make sense to squash this patch into the previous one,
you can mention Robert's contribution in the commit message

Konrad

