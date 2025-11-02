Return-Path: <linux-arm-msm+bounces-80029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAAC29390
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 18:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FDCB3A403C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 17:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291CE27FD4A;
	Sun,  2 Nov 2025 17:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aye8SA+T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/54NvK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3621EC018
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762103894; cv=none; b=XCaec3MR9ojIAxbnNhsYlNKrX+Fk4DN4fRjxBrXxnosMVFc6R9JHpK18NuetWOMnYTmvQSLqrr0hjQ4BKiogdT3MdMNGK5xw9dIB0Lp3edTaamNT5KRHyWTgIkGSlxa+RYaS5ch+JzX1GZWSs1zUmDK1dzZjGNkSCfsyfvVLmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762103894; c=relaxed/simple;
	bh=NtlclFDbgys6p/QZHwkycv/xOaVB2gh9fmk/1OBfx+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kHBhBciYYfElVCdWfl58M7f/g9tkS4AqJMgEhnz97p7Om01Cra+7JXtGvRhd+qeeaqt/mNHTGH2Zpa+l5VcZOoUOWuQiptftTrBx3kEMQahWZL7Lihl4V6KqO21oTLesPuecm6D+q6gw38KJ4ALg/8UNqR7QHwQ+oZRg1aMia6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aye8SA+T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/54NvK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2Gg6LB653176
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 17:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeRZyUZYi7aX+RIWfhNiPeJfiMbKLxGi7DdTStgd/lY=; b=aye8SA+TyfdJA0q8
	kP7bvDa+LzwXA+x0BQ7mIzZTrtd8EcQs1D77yFy34t7mDozG2puIVEviq1qWJZEp
	hT0PXOqdeglDSR+2o3XWVYjbhWsy+SaUs6c8V+JI8DePuKJcGasmNlblPEkjCA6f
	Wete+uYpfeXhG+VNG9l+0XhpLC9Uu2Sou2NZoykIopKYjGiKgz3dqxAL5HNvA/rm
	hLsztnELG8QVZZgM2fmorj9IFTdEyGs5UR/wNR8GZZA+rOvT7ESRsboQRjqzxVAh
	/+g12HuOH6e4ywEQAQ/wIQWhwlEsDBUmgm4Gl+Ccxn0Re+JrkC587gv4ddGNNRbH
	u2eJjQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a595rtfpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 17:18:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4eb7853480dso112861211cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762103891; x=1762708691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aeRZyUZYi7aX+RIWfhNiPeJfiMbKLxGi7DdTStgd/lY=;
        b=L/54NvK5K2oEfnGJz9MuqHwHMvmiJIW3BHe8MUOf87uUCLQ+RwsQbVfNJUL0b5kRV3
         BQM8f3mSmVLChFpuob2kehnc1Seq0cCU7Gk8RmEZInmJvF4U5FhMPOC88UdfXhE3fJix
         bO0Q+qEEImrpb2EMvpXxbWJZ5oZP5dtj3lhVR6vnd8wKDRDiwmnfDieXLlFdATo9tEkW
         fSp1Z1ynus1HqsM0O98/d0lwoVF/dL+h8j0JWCwYisDUZVhrYd/kj804W5ERJUcm6Hvp
         PvLwISyJpDo8zKCikF0qJTU7/xrhQZZgUXDaoXb0bOJae3IufuO8OG0r/tcIfmv6IV8O
         t5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762103891; x=1762708691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeRZyUZYi7aX+RIWfhNiPeJfiMbKLxGi7DdTStgd/lY=;
        b=afSVrOiYJKCjgab5RuOe3oDeT51kEo/lF0pNuPMnznFK3AAYO9tJjuGCV+eLJzix/P
         6MD0QDj8V40tvOczVseh0QCeOzJGdQ8aV7g7ML4Dy51Vto0D0tTZuDtkGpi8J4xV3EkX
         24BQpZ4/K9xt1+M827LEleUV+q27mTKwqCU9Ra7LE74sSy5DpSze+hhjNaa3d+7bsYX+
         Pd0EoyCWy1WrCiD+/yMDNgcOAR+Yn++Nn9V4bCGpg52fSHkZ1Df+xcM34989fuUvlIUA
         QG+20U+uR0lWr7pQotf/pCn3RR0EJ2OdFpwQOYaeDGFnOzMmor2uHyHYrmRjnhJqxHX3
         jdWw==
X-Gm-Message-State: AOJu0Yzwq8Frm5hEpU6Dn5ahnUwageAqYqp82cFQ56bYtOoHNrXbzJSm
	oQPCrDcw/YBwiQowZW23g+m6TYMowaMBtMPPjBb0syep1Lnp7tAuWjk9qAgYUIr7KmBsV7N6T6W
	qZIY9+B1FIDL7vZZpZmq28NSRiFEcXg3TXKWi77Hc2i64c2A68zBCzpyLl/6aaE+shXSs
X-Gm-Gg: ASbGncsdxo5NFvCz4/tOwnvLulWnHQM9QBfllZ/2e5yakmmOw3ndCI1pyfJ+SJLsI18
	/ynZu+dQn7MYbIwpu81LPwkHQzdUUx4Z0fA5VIgL8ZxaAAtPA6KZ1/0iJG1OzF1IF4n3mU9G+y3
	sAI10bc+6YUlJLCHUPAkFUhW+xd7suZDECekMmXRT6o7VkA8zRSyzDPhw3BTbNV/DUb3+8X5Ep3
	b06mgvtb+KtCl8LrNTfLYzEiJd1JUTJR7ZWzdZ7zhuSN+wUsa9Kx8FvNmZ/9bm1EzdBRwEyDeTM
	9nDaAloawXX77dtlwDx/FUwG2ty6+SZ5nR+78dKXSe573c7bjgPPOpFNjA3hBNXYR+HEG+CAX53
	i9I7NGu9nOiexYzeL3ExOLZPshAcb6kkU9TPidnMqRTMxbaa521XU/WDtK31ykw==
X-Received: by 2002:ac8:5ad6:0:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4ed30df2e84mr137632131cf.24.1762103890778;
        Sun, 02 Nov 2025 09:18:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCiw3q1aivkOxuxe8tCdcM9EP+t0I9h3ckG6VtvfFNsJQhBR6kF6ZE1dwvvuxyHVpWI1743Q==
X-Received: by 2002:ac8:5ad6:0:b0:4eb:a8ba:947b with SMTP id d75a77b69052e-4ed30df2e84mr137631821cf.24.1762103890321;
        Sun, 02 Nov 2025 09:18:10 -0800 (PST)
Received: from [192.168.10.38] (91-154-146-251.elisa-laajakaista.fi. [91.154.146.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59425d28de5sm1164418e87.59.2025.11.02.09.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 09:18:09 -0800 (PST)
Message-ID: <d777a9e1-43f9-4028-a342-e723dd2c800f@oss.qualcomm.com>
Date: Sun, 2 Nov 2025 19:18:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251102165126.2799143-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w9zKlccu_py2pL3yO650KPaROzBu5uIg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE2MCBTYWx0ZWRfXyMs0ErVMVVBy
 FlApRbKd6c/o1fTQcV3OgX4soe9eti3cZjKIOmmF9AJf5j93DdIBuI7eAb56O+UbKLTIcxM5Vk7
 Aw8h5R0RdiaqeShHTuL1m3hXIBDOCFA6a+Kpg6kPargP/wOqZIOAwmqfkrBC5RFKprHqNWpXKos
 D+PDXRuzNcgWFyVw/8bHEq23uDDSSkksnwVn++ee0Uq8XwIyHTJRHqRK84uK0pNaFY4wJUZTpQd
 /bWounj1ki3BkDfbn0ew/LT+SIZdJ1cqUxZCXwrVKBR+qT3yzB/uZIpV1LgB5PmNy6Iwf3CyJgJ
 E6pF8vARMuhKw5s3z12v0CpQRng5UwJIsdtFt/dUnoL2iWij5o5xcYmufGYCa0VtwA/iHUhjZdZ
 ws4Eoj3tzVoxrp40fgTUNC/plrgQDA==
X-Proofpoint-ORIG-GUID: w9zKlccu_py2pL3yO650KPaROzBu5uIg
X-Authority-Analysis: v=2.4 cv=XYeEDY55 c=1 sm=1 tr=0 ts=69079253 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CKk/IlMN6Gw3Dq31eR3Dfg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7mYrOhUVQ_mZITg_WmQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020160

On 02/11/2025 18:51, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v4:
> - Moved remote endpoints to SoC file.
> - Renamed vbus regulator name.
> - Moved usb-role-swich property to SoC file.
> 
> Changes in v3:
> - Moved "usb-role-switch" to lemans dtsi file
> - Moved vbus supply to connector node
> 
> Link to v3 DT:
> https://lore.kernel.org/all/20251024182138.2744861-1-krishna.kurapati@oss.qualcomm.com/
> 
> Link to v2:
> https://lore.kernel.org/all/20251008180036.1770735-1-krishna.kurapati@oss.qualcomm.com/
> 
> Link to v6 bindings and driver changes:
> https://lore.kernel.org/all/20251102164819.2798754-1-krishna.kurapati@oss.qualcomm.com/
> 
>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 108 +++++++++++++++++++++++-
>   arch/arm64/boot/dts/qcom/lemans.dtsi    |  20 +++++
>   2 files changed, 126 insertions(+), 2 deletions(-)
> 

> @@ -454,6 +492,53 @@ &gpi_dma2 {
>   	status = "okay";
>   };
>   
> +&pmm8654au_2_gpios {
> +	usb0_intr_state: usb0-intr-state {
> +		pins = "gpio5";
> +		function = "normal";
> +		input-enable;
> +		bias-pull-up;
> +		power-source = <0>;
> +	};
> +};

Why is this chunk here? Please check that the DTB is sorted.

> +
> +&i2c11 {
> +	status = "okay";
> +
-- 
With best wishes
Dmitry

