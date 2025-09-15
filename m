Return-Path: <linux-arm-msm+bounces-73517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16004B573AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC7577AE58E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 08:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB9E2EA730;
	Mon, 15 Sep 2025 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OjDW9m28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F49E1DF75B
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757926414; cv=none; b=nMozvfqOylclqeSbmNNitL/6xhdtH+TaKIhBr7HP7UUsrNTls/k6I+62gzw2nAMUq5Ls7snFEpWjd6JkR4zXmeCRE6b+hHwWk8SXrncZLF7HlM/PwB/gka0eVKN8z1ezD+rGe2DWQY1XpwNh8C9CZpF/mWKIH1xavki83ArYCsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757926414; c=relaxed/simple;
	bh=S45awvN3cTWhpX5IDC+70SRwYupcAKA+kaIquVzT3Ss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmHOECfA2ZMGe9XvXybvqLcMd0a64eaDeevP4u3iH1Kb2dix5cfNY8oLXqdw4/ivc0mfBr88j+X39n8kaaC7T++KIIqbmLJb7CY25DE9gFGQNdicqhtxo6OSFYeVZQ1dLNsocAqqmEdytFIjDGL3jvEOV9yz9l4hJwTVx9MdFo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OjDW9m28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FiJb023135
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4r+niUOvJYA1UJcr4thXBmObSCAsqKRkY4krHVU3u4A=; b=OjDW9m28GwytyRU+
	+frj56qkSewdYLjfyBbcECnbRTIrTJz7dure5ZZsuqECBxj+cgzesUYht6K1wNma
	9U1ZsOIuQhARfVC8Wo6s2updMH9g5zOK6DvRiiYUwtgKm80hiqM11HxLTMTSHA7V
	mQ8Yd2IBu+s6T+Lqm7FfkhY9LTUukWnN4RFLEsgIWoxTRKtFsbhCw6zxCbBQ/EQy
	KEfO0WljHFaF/Cu/b4IdAKvJnqyledhNUbHes6z1cBpFlpXCzPzrvG+84mZW9NKz
	4qIQUbVZKtsi3vUHaJGNP2Iu/FSVNDXbpiujpuVg49e4a6q8/G+TL67wf5pOnaq+
	KJ1NaQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbc1ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 08:53:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24ca417fb41so37761835ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 01:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757926411; x=1758531211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4r+niUOvJYA1UJcr4thXBmObSCAsqKRkY4krHVU3u4A=;
        b=HlegY8r6+iKwfSlijV/83Lx1Kyhqw4kQs35N6hjYLNt4jIZxX0QB087RuvL2PHmnwY
         GSE0jdGbYahUPUMX4JcRrVLL7GVMj91q4Bz2W/Qm7FeX8HuHMsUnvUjXS8VWCRgOJqN5
         PaWmIvW/c5R7jioGkZVld40ZOG+K/MMkqisdXIFu6tZLt+xiXPT4V/mBbYE2qSwTvO2R
         EYCpC54B56ucHpCKr5gUCgnMhRHPfcnIFld39gHdv/fkuQ2RcHFohm5oRRHFC9E/viiD
         2XY1280gJuLi6z4YzPcg0G3DuFa81TrW6FDegqg8xCbCHU4b0ZArWP3GO+31OcAzh7bl
         SB0g==
X-Forwarded-Encrypted: i=1; AJvYcCVSjZWpSjQZdFaTOp5R4nD2YpeaWH7jkSCJ5TtzxC6VQu76amRc+XdZu/BCl7WWaLVnDus77pwQ2dTch84a@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1hfIUhlQue7poMewA2lZLhc/9Gxb3+k6Hxkcinw0Mdv/vmnN
	jV1ZuBM+FMtDZzZppl1/D8MK7C3631LqwdbTW0/7kZOiADJuYw6tTkdvHcAzmLDkhr8i9S/MvnU
	zgmqneap+sEKKdMms0cb1YZZxeYwGgLRwEzbbvdX67jiLARkQjUZVaw9YV9AtYWCtfeYC
X-Gm-Gg: ASbGncvnvKQHAXinWlB50LSMBLaLz5epdT0qgoZlIzy4ameL1gspJbEfEOt4hM2ma2Z
	HWTSmKIHsn7g82yiAuriLpRV8sYGsMRakOuxianmb61naQp6MI/e83C+W+awdA/aZ29aqeQ1zh8
	J2f2u8V6NtreuCijCycgXs/OWoM9XCWPA4JKQ0e0/JvAFLtBhRB9Dz8uy5tEpTin+x0d6WFfBLr
	OdRhCMy41G43UPCrZVZiqCrleDbd2NAAXJD4iRq3Bv8DPEhwrDZ/aAn6vuzcsaaX5MDVOjFCfwL
	DCZ1+aVszcpVlINJSRkwVCvyXQjXl7RRFv4BnpuT507j1S95NTCEMWvxLW/JFQuluAaOvqSJc9H
	z/9mGLuh7fx7CW41L2FBqJ/VnkJAzmo3Meg==
X-Received: by 2002:a17:903:1b10:b0:252:50ad:4e6f with SMTP id d9443c01a7336-25d27038fcdmr157648235ad.54.1757926410993;
        Mon, 15 Sep 2025 01:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENt7QnFAil5iZOk4qDkCOqaK4rvUzqvImltsyILTqsN/ETeoEWfmXbCYerWe4mkBUy5D/vIA==
X-Received: by 2002:a17:903:1b10:b0:252:50ad:4e6f with SMTP id d9443c01a7336-25d27038fcdmr157647825ad.54.1757926410508;
        Mon, 15 Sep 2025 01:53:30 -0700 (PDT)
Received: from [10.133.33.238] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-262ce653f1asm53418595ad.63.2025.09.15.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 01:53:30 -0700 (PDT)
Message-ID: <9d46a3de-77e5-4f21-a2c8-85f25d15f079@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 16:53:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] arm64: dts: qcom: x1e80100: add video node
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <quic_wangaow@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-2-38ed7f2015f7@oss.qualcomm.com>
 <aMPdoa6wVEW9q9Sn@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aMPdoa6wVEW9q9Sn@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c7d40b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Tt4CGEpwzN_lfr499RoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SDlcttDBaRm2LrTniNbY9dpKPQ0bKrAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfX0xiIvKdHmE/V
 sT56ooAq4LR9UcMO4gbMhtrEoU8rimeglALzQnZ37HKYC7lL/4sLebsV97JXJlD505LDvS9cJ0l
 QOSrOMo6IrBdCM7iK08cVRtJesjyU+M5elzivU9UWIF/oXwN96+ZHeikPNrTVuBwR1kECiRVcBl
 e/LMo9UHe55RqglE8srEm9/1rdraIR5ae4vxOY7jJh6+PCws0G2B6aaVzU2a2kyKuHyHTxELZ/y
 WB1+32U0iEycvEHtvEsCosvaL2PwVqbpZC7sdVtGqkoxLLhTjCUA5TRavvcfGYqPGI3mYlGD72j
 A6PeOByIHfUQXe2iTICHgGg22vwSR8yddASgitztE2eG06J8tW8CwLp13V3L/QDdwIHCoBs6J69
 5+/HJTGL
X-Proofpoint-GUID: SDlcttDBaRm2LrTniNbY9dpKPQ0bKrAQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_03,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042



On 2025-09-12 16:45, Stephan Gerhold wrote:
> On Wed, Sep 10, 2025 at 05:02:10PM +0800, YijieYang wrote:
>> From: Wangao Wang <quic_wangaow@quicinc.com>
>>
>> Add the IRIS video-codec node on X1E80100 platform to support video
>> functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 82 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> index 737c5dbd1c80..4a450738b695 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>> @@ -5186,6 +5186,88 @@ usb_1_ss1_dwc3_ss: endpoint {
>>   			};
>>   		};
>>   
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
>> +
>> +			reg = <0x0 0x0aa00000 0x0 0xf0000>;
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mxc",
>> +					     "mmcx";
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core";
>> +
>> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "video-mem";
>> +
>> +			memory-region = <&video_mem>;
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>> +			reset-names = "bus";
>> +
>> +			iommus = <&apps_smmu 0x1940 0x0>,
>> +				 <&apps_smmu 0x1947 0x0>;
>> +			dma-coherent;
>> +
>> +			status = "disabled";
>> +
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-192000000 {
>> +					opp-hz = /bits/ 64 <192000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs_d1>,
>> +							<&rpmhpd_opp_low_svs_d1>;
>> +				};
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000>;
>> +					required-opps = <&rpmhpd_opp_low_svs>,
>> +							<&rpmhpd_opp_low_svs>;
> 
> You need &rpmhpd_opp_svs here for one of the OPPs, because this
> describes not just the requirements for the derived clocks but also the
> requirements for the PLL itself. sm8550.dtsi has the same.
> 
> I didn't realize that you sent a DT patch for qcom,x1e80100-iris, so
> I sent my own patch yesterday [1] that was just waiting for the
> dt-bindings to land in linux-next.
> 
> Have you talked to your colleagues in the video team before submitting
> this patch? I'm pretty sure they could have pointed that out during
> internal review. They also have access to my patch (which has been
> shared in a public branch for over a year now) and knew I was going to
> send it as soon as the binding lands in linux-next. I just wish we could
> have coordinated this better to avoid the duplicate work. :/
> 
> I suggest that you add a dependency on my patch series or postpone
> enabling IRIS support for a follow up patch, it's better to have it
> separate from a new board addition.
> 
> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/20250911-x1e-iris-dt-v1-1-63caf0fd202c@linaro.org/

You're right. I checked with my colleagues, and I’ll remove it from my 
patch series and list yours as a dependency.

-- 
Best Regards,
Yijie


