Return-Path: <linux-arm-msm+bounces-80707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78FC3EE5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 09:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A83733B2EAD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73138314A9F;
	Fri,  7 Nov 2025 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C58NAE8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoeUXU8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D10F31355C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 08:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502897; cv=none; b=gswVXNycinog9orGHpBdTm9a9FWerC9U1fW4+fUq0BCP1H8X/VangS3uw6LBujv1Aai+0HLlfeMr+EfVbuZZBR48IiXRW7dIGDuSvj2ZVkUnbxCfUtIQf3RDNcpSjscl4tGJDAYSGfetSL6k8Jfn6Ov+cFHnjg6YiHtId4BfB+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502897; c=relaxed/simple;
	bh=ZxySiNKOJ7Uo6dLCp72RFEbCgvn+qak+fhlT0zBaY/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5CndC2FRykqDm9yG9ciRoPHylWxY9Bkj8bevlTgK5FliQBjnZ+H73I2GcNsY8TcV08lMwAETFH83+821vkg2+3G6gaBdoLkJdWp4vwvHRz6QJvjztHa3bqBC7WuwHhw6nW9KXadnhgBzukXgekjK3kNLjQTcCPjuRtPizYjbCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C58NAE8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoeUXU8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6NCpWV4131381
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 08:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=; b=C58NAE8b9p525Gky
	G2vFjZSFtFQr3c+PAxlCUvzMVaYoP/PefDeocRMcpiHbs5HD54E7lHnSOvwiVifa
	K75kEGN+gTBqZTKBJJ41RldeBRpy0E2Jc4BIZz3jslomGfj9kqy5DD+mY4U4CW3W
	Kyt+rPtSc2GTDYJ2Zg5z+yYVysVU0PG5iePyjsHFssLedj6auI4TurEv6dFT7cQM
	CqeRe07SU2fG6LXxlMo+sfZBsqnwOSKr6ysAr67GSze/qo86hW/rqOzRPdDpls/+
	+zqD3GPPt/0gVrWpDXixUbBwPLklm6UP9vJVzEVO8Uc7eCoRZs9nw96xZJ5JmU/e
	jZy4Pw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x389q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 08:08:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33baef12edaso797443a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 00:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762502893; x=1763107693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=;
        b=GoeUXU8bgRdGQqU1ENxSI+7jyvWoKR79vRApM5MsedxNyHL/tAQaOvEE2Bb4VHI9Tf
         ht74fuSWN28Q/nKQfu0mSNT/G9YOWMr/QHtksekWmwPHTttQY7ANgIn5xCeJkmp8cHqu
         PY7vrNDXPcwYIjLs5G1uGHRwBw0a2ymqDZ9c04RwszO7dpFiDxk32uPJTEnQkB7a0vui
         V1B/pdFnWql4WhVnOMBPSo0Y3sYO8ko4MU9Dv8XMYvFk768JHqUxouhX3K0mhm6ccDwa
         +R7MHVVFz/xllTCRTteN0F/THa5a2b0CFG8jtPmvqBzTL558JYPN8uPxuB+5cf1EDtra
         GHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762502893; x=1763107693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVnCGM8cdwol4pZjBWecGHgQ48zUJyNe3I+X4UXo7pA=;
        b=l8fCTlZum43M8kmTInZmRMR5he6QUuMk7rBrpgofgjEcioIJqdQUCQMmyS3EFuIBnY
         JtwcBkZ/gfGYepS6k4PgZ3J6igTP6iy33mupYqyLJ5ByYlRfQ2nxd4FAqUTiZAtvY8wj
         XM1oaP06EwnNN8tRnvGxMpAXBBv+UFlYJQdvTC2vfwl8adk+3koBv8S84h4uMyRo9p+G
         uA4qDRy1Mqijz+rza6qly7qoRzg+//BlarpkAK4DzVg8LQnijMmSpNkF5D9LIvnJOLhQ
         oiZzFxJB5tUZGR5/vUQW8I/LQ0i63C1l9qYPvldfumu+JQKMH8IO7tX4EjBspshZg2IM
         Ip2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6W22D6Kw9A+guxHoV5S4fel356YaJjX072/KBi2UBhyXz75S8pv+SMw6MjHzBxy1iao2Xbodt6CZzyw8F@vger.kernel.org
X-Gm-Message-State: AOJu0YxliIFFFsDxGd9AxfmDfcLrwim6q045afCeBCE+N8I1V0B8Ub5I
	7EFgfxHnAwJqtHOQtZpKuUS7t1jWkvbb1xnd57FLa2HcZNPY27W2g19eET3BLw8lcS665mH+zlp
	hGyxna0tgbg2g8K/ELsJJWuG0emqtCWxh2K+a57tIQYOMN6P7iHIxX1FWTQYVRFzhn6ne
X-Gm-Gg: ASbGncvCJr9SCLTXKE3Xqep3ttSLBeDWbnJvN8H9wEYpZFMnil+/Pr3/SLVxY9zPptA
	mzxUZZ8DwAwHgG9kdfKYsTisyglg1nR74wfGXeB1omZFrh7aRSD6WHY3pHXD5tQukFRY2Yayd4H
	wYT3dKWHyf2niu0V3RuoLlHvT4rhQy50zRA3M7sYpgFIOqkQF/wIvlsvwTYfXuxTV3X3/o8ErRs
	VWpzQ7oRlIMN7NvW/oojFk28uYxIIc7rWjusXLZizUYn5SO7w/a8NKcDGKHX6g/vl84wpPyBpCt
	f6dXCoH1i3DEQY2jAHJLYVWQcnxqkq8qx7Qgst0vdHj6ZBc7SENqSfTapI95EODLyw0W8NZtWrG
	h/G/88x9+Sb14aQLb
X-Received: by 2002:a17:90b:2f50:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3434c4ea126mr2240870a91.5.1762502893236;
        Fri, 07 Nov 2025 00:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1FwVg6yQU1EcNZvCXM3C9fT1xMu8vEORqyrlogZ+caF7N9+pZ1qv8BXFFp26cya3NewfKAw==
X-Received: by 2002:a17:90b:2f50:b0:341:88c9:aefb with SMTP id 98e67ed59e1d1-3434c4ea126mr2240800a91.5.1762502892681;
        Fri, 07 Nov 2025 00:08:12 -0800 (PST)
Received: from [10.64.68.86] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c3357bbsm1837440a91.12.2025.11.07.00.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:08:12 -0800 (PST)
Message-ID: <ee2ddf1f-0403-414e-a77b-9c20431c50fb@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 16:08:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 14/14] arm64: dts: qcom: qcs615-ride: Add PSCI
 SYSTEM_RESET2 types
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Song Xue <quic_songxue@quicinc.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
From: Xin Liu <xin.liu@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-14-b98aedaa23ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA2NCBTYWx0ZWRfXwr7RaYLYE2zU
 RRgteWNTJI1Q7q2iFKPDb0y2LXZAjOdKTwGwRJmD+a5zOcAdsTWa6jMAQKeGZD6hENzNPj3LJfX
 lGC9zcW44F7jZP93Pl9UtARVguC6xSnTUvHgh47yZkrOTxx+ONqc+qiCma/xx9vadHl7mfvz3Fb
 bgwKAnwhJTZxumKvVlP83366CX9vq7i2fEhYD/2H7/pe63XNofNjQn4/s5tSN44R4wu/EsOb5ZB
 PzU2iGWMD02wSgr+3uL+OBnWUBgxrVFtaF6lB+uOjc6FsxV5OzcocTWr4p1RrGuJwGAtKERre+E
 XouNKmhtnHki3kSgy1JvpXac7i71rYniRJPpScvTwOP5Jwj19yDQJm3LiS/PGxmM3k1KQ007n9O
 Iqgp4BYJs/UZ2aR88CedzG80R2Ba0w==
X-Proofpoint-ORIG-GUID: x2P-7JeBQbUbUGcNLCNAX9nmcOj5E-AR
X-Proofpoint-GUID: x2P-7JeBQbUbUGcNLCNAX9nmcOj5E-AR
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690da8ee cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=n3IlsZjKbDuTWdq3ZzcA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070064



On 10/15/2025 12:38 PM, Shivendra Pratap wrote:
> From: Song Xue <quic_songxue@quicinc.com>
> 
> Add support for SYSTEM_RESET2 vendor-specific resets in
> qcs615-ride as reboot-modes.  Describe the resets:
> "bootloader" will cause device to reboot and stop in the
> bootloader's fastboot mode.  "edl" will cause device to reboot
> into "emergency download mode", which permits loading images via
> the Firehose protocol.
> 
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Tested-by: Xin Liu <xin.liu@oss.qualcomm.com> # On qcs615-ride

> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   arch/arm64/boot/dts/qcom/sm6150.dtsi     | 2 +-
<...>


