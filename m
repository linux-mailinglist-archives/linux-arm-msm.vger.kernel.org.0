Return-Path: <linux-arm-msm+bounces-77175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08261BD8FF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6AA18A388C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B7830C36F;
	Tue, 14 Oct 2025 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6qqLXBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3030BF6E
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441157; cv=none; b=Il7pRznoQcvjikKx1nFRu30CjOvjQzaYmClW6dlav7sPN4UOUPdc3WXol4WSlvcitAy+aQBg2dRovx0/RIhYdn1Mv7L8yjDmAidmlj/GddtGPstDBPMBXDsknZiPMDLY8EF0wgRAcvO5boaxKW+BDNYyffyQmIjs0uNEwwkRSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441157; c=relaxed/simple;
	bh=j686w3OYPk5TRiSL4y3TUeaPyqS51Ap3zi6yDNE7Sl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJW6AxS83righIPjwB0wgJrUl3ep1zmwoShSXBb9J/Lv/ld/HPcgBsTHkonOzEa2icaxi2U1cSEg72EJt98UL3/LGNKolklxSksEFyzSEeRcsC8svB30WZXPhiMSkSK5kY/+GcwzTpCVrOJ3qIxeYqtX4rTjbw6aVs/MkGAsx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6qqLXBl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87JbG031000
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=; b=f6qqLXBl9CpFDkBF
	RhNN9adguwXk6DD/nBJfQGSnXfPCr9mfRDJwKmkOhwBzumRbrjFW/5RE2K7PyivO
	dCCidrcSqjxY3vqARhVOCnUz6gX0E/O1L0NECosMXb7rcItIy3dBCoqzVZnsTY1x
	oDMNmidK7J2AsHzNUcwO7Dpx7hA8vRQM8LZ/NgmZKZeJ+xva3z5ZXOAFkeGxlXYg
	5aKCJcyu60uoIOxpkxW7wbWO3f/M53rdEcnNpqQU1HWiprzTtNXPoQ/vuwIwoih7
	h5dPeRLu3xC+u3ZUcO+7XsvFw49cRwhg4p/opOOzrl57jtWWn06MMe+3iBes2Fhr
	RAVNZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0r7qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:25:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32ed9e38bccso2157121a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441154; x=1761045954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lB6sFQ3LeiBx00eAv9moG4oCFwLs4x2w8B2DPiD6Hkg=;
        b=sKz1Ef7HxUSACwbvgrzCXlECPoRu13hlBnwE9d54xWmm7Yq+wETS9ap1Swb872t/92
         +7hkFKvfqOM1cexa16+nJykS1ihSoY5xcp/GHfnHRQ5vJWqJ21+WOXTHuakvn2fCMENN
         zLLlV+oJl2/FSMUlV8HS+HLOfwRdtnrGaz/sXd0aH6LPY+4FRpGlI33mz1KVo1E5lcK7
         tEvvInm1HDyS02Ti+/CdsVe4gh4cNqiNCPFgEnLAJ6ZZ9aBcyZBPyRtg+9DVmyBFjpoW
         90qt1nanqsuf3ua1O3uiyk9IwDuHTG0T7qJaQBZR8aRhuHrsr2+Q9/2tX9rsJEzpLPxe
         sOAw==
X-Forwarded-Encrypted: i=1; AJvYcCWYQ1Kfyhe4z00/b98PIDlM1geOwA2ZO4+umuNuSs0rMKtTjgtjUOmvMi3dSF2JwnOUYT74QenFixydZBtU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyka5CVlVrK3wb+Bu1MFPdTHiextzOQq427+23y10ZZjZ9nCV7W
	dt9K/7mC7AyI/hXtZtxHZxATYudkpRUYhTVqjq4g2Aad1GSutIw4f24VI9fSPc+ACLb3pgPopPx
	OBSGBwT4uB8yPWWW6aV1m955BWo4ebLUYqtd95ncPavY/jb6OTzhWK/J8X0wzdn2hYdoT
X-Gm-Gg: ASbGncvDSxAEN8kaFwiU2MkaeNyGkNr6a5+puGqicfxHVrW1QrtUG0lbnJxgbGAIUwL
	wk7dCly2sDNWAzzYuTDskgcPPPN+e9eBWW1ozy91AeMVp9pRCxoBhajUNhHoAP6YFA7dsZhWDju
	zVHqO4eYodU6Ue/DxwbeZf5LsUv0AGAfBgBtheMxKApcGg4Jb2wIUA3iPqkEFtYxx/R7hGu5HtS
	8jDKckEE7h847lvr/KRc+cbtcLMeoJa/t9hAaFChQgtVt4EzRXO7Bz2jVtlIYsswy00C2g1amvk
	N3Yt6LXgsnKEp7g3tkyKvsTrKbeUUtxyluW0T5tA9oIhQYHzpQYTr2KE4spjdwci0K3UqBd8Jr6
	VE9KzR8SNgS/Bnu4yqnstl2wWSn5bQaeaOCI=
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id 98e67ed59e1d1-33b513ae791mr16920101a91.7.1760441153623;
        Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlyXxDUchBxkJ8hKzcSdS8zUzwWZdwgzzM7euiuaBwsEcgugKDNWgcZSO4YiCAcVeXe1f/pg==
X-Received: by 2002:a17:90b:388a:b0:332:3ffe:4be5 with SMTP id 98e67ed59e1d1-33b513ae791mr16920082a91.7.1760441153080;
        Tue, 14 Oct 2025 04:25:53 -0700 (PDT)
Received: from [10.133.33.159] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b11ca9sm15658229a91.24.2025.10.14.04.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 04:25:52 -0700 (PDT)
Message-ID: <7277bc17-112b-4fc9-9099-243d216893d8@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 19:25:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Enable DisplayPort on QCS615
 Ride platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
References: <20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com>
 <20251014-add-displayport-support-to-qcs615-devicetree-v2-3-1209df74d410@oss.qualcomm.com>
 <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <kxwavurs7ebp5f22gxutvw4thwm24twqpahszhyxsodsikunja@7hl3y65ppqmo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX08PZ55EjaorM
 AyXRxjNzx7P/RK4wIw3q1MfRgA+6jd/AUdOsBWj4a/U4EDoxFCa4dssc/pavntpZ6F/J7LPVfvq
 Ms7FLEqYP44hQG69imp5KWwkCvO/4XwDRMkg4KoQBlpxVjIwj1bvf6h9JySI+3B+BfGAqxdTZQG
 Cxgc92wF1Ejc3Mvw7L3Nk8YRLTzGU8cpDGDPifEaSChnQdFWuOpb5AFPhX5LzcbwcO7NyFMldID
 gNzqGFnAnogJUAhYYxIDbYTBIWQhhx2j2bXNmJLEleGLlTm6nKOhYpY04Qg5yOJZ2ZfvyPN3ya/
 F2CYGSNjmEDTLPoQjjsurdaYPq1NntgI13tGVngvFlpKcOcAIoIN/8GI6vy+CP7wJ6rfbZEhv/b
 jUQgXUcK2KwT+3GtLJC5QDNYuQvI5g==
X-Proofpoint-GUID: vpvU0JkhCHTbZruO_fPZLCFquAjOOHzZ
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ee3342 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=lUa4T_ycwPSD0wKDvOsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: vpvU0JkhCHTbZruO_fPZLCFquAjOOHzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018


On 10/14/2025 6:21 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 05:42:12PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> Add DP connector node and configure MDSS DisplayPort controller for
>> QCS615 Ride platform. Include lane mapping and PHY supply settings
>> to support DP output.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 31 +++++++++++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> index 9ac1dd3483b56f9d1652f8a38f62d759efa92b6a..0b8bcabdd90a0820b1f9c85e43b78e40eb8a9a38 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>> @@ -39,6 +39,20 @@ xo_board_clk: xo-board-clk {
>>  		};
>>  	};
>>  
>> +	dp0-connector {
>> +		compatible = "dp-connector";
>> +		label = "DP0";
>> +		type = "mini";
>> +
>> +		hpd-gpios = <&io_expander 8 GPIO_ACTIVE_HIGH>;
> Not the gpio102/ 103 / 104? Interesting.


Yes, on this platform the DP HPD signal is controlled by the pin controller
on the video-out sub-board, not by the TLMM on the SoC.


>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss_dp0_out>;
>> +			};
>> +		};
>> +	};
>> +
>>  	dp-dsi0-connector {
>>  		compatible = "dp-connector";
>>  		label = "DSI0";
>> @@ -423,6 +437,16 @@ &mdss {
>>  	status = "okay";
>>  };
>>  
>> +&mdss_dp0 {
>> +	status = "okay";
>> +};
>> +
>> +&mdss_dp0_out {
>> +	data-lanes = <3 2 0 1>;
> It's not a board peculiarity. All QCS615 / SM6150 devices are affected
> by this twist. Please move this to the SoC DT file.


Ok.


>> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>> +	remote-endpoint = <&dp0_connector_in>;
>> +};
>> +
>>  &mdss_dsi0 {
>>  	vdda-supply = <&vreg_l11a>;
>>  	status = "okay";
>> @@ -623,6 +647,13 @@ &usb_qmpphy {
>>  	status = "okay";
>>  };
>>  
>> +&usb_qmpphy_2 {
>> +	vdda-phy-supply = <&vreg_l5a>;
>> +	vdda-pll-supply = <&vreg_l12a>;
>> +
>> +	status = "okay";
>> +};
>> +
>>  &usb_1 {
>>  	status = "okay";
>>  };
>>
>> -- 
>> 2.34.1
>>
>>

