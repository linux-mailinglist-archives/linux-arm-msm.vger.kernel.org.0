Return-Path: <linux-arm-msm+bounces-1707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E1C7F6113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 15:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20EC9281F44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83D0C2E85F;
	Thu, 23 Nov 2023 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PnewYGcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17257D44;
	Thu, 23 Nov 2023 06:08:09 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANCeGkg032073;
	Thu, 23 Nov 2023 14:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=OEAROGnnmwLYzFPw63TAfHhUI9YicpFnZ5bBINWjykA=;
 b=PnewYGcmw1BQakUf43VMvg91DGhMtQieJ8JPfai9u4WDY/QICA3JcHFveLqx64ziTCfX
 8cK5SDyuTuITSVZOSmQ75yho7sHYPBJrifblIRq5HsCkkp3BU1AjzilAfsB899Mp1Fpj
 GMa2fWOSdbCmdYv8DCB7EcxmdXuNJbgD4hO0kH47msv5PD8wV7bILC60RLGVJkDGWkDQ
 zhfe2PxK4Vl9vyg+j7Vi4ka8JY23nnZYxS+kdSgy5Lt7vegfI2hhq3hrOhQjgXF+8QLP
 FpRkz/KqLf7L4rpIRWlOFwg49Rc1vqCyBIrriXWO0VbPGp8cQZ8yyWdh+8Wh7tBaZum0 0w== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhvm0sha8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 14:08:04 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANE83NZ028413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 14:08:03 GMT
Received: from [10.216.43.77] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 23 Nov
 2023 06:08:00 -0800
Message-ID: <57eed7c3-e884-a28b-a1ff-e5aecbb11137@quicinc.com>
Date: Thu, 23 Nov 2023 19:37:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8550: Enable download mode
 register write
Content-Language: en-US
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1698253601-11957-1-git-send-email-quic_mojha@quicinc.com>
 <1698253601-11957-4-git-send-email-quic_mojha@quicinc.com>
From: Mukesh Ojha <quic_mojha@quicinc.com>
In-Reply-To: <1698253601-11957-4-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MtdaFQmtmJAZlN_-R2PVX3kSwMvzdpCH
X-Proofpoint-ORIG-GUID: MtdaFQmtmJAZlN_-R2PVX3kSwMvzdpCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=796 mlxscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230101



On 10/25/2023 10:36 PM, Mukesh Ojha wrote:
> Enable download mode setting for sm8550 which can help collect
> ramdump for this SoC.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>   - Improved commit text.
> 
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 7bafb3d88d69..c94d06a9290c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -324,6 +324,7 @@
>   	firmware {
>   		scm: scm {
>   			compatible = "qcom,scm-sm8550", "qcom,scm";
> +			qcom,dload-mode = <&tcsr 0x13000>;

Sorry for this but made a mistake here for sm8550.

it should be

qcom,dload-mode = <&tcsr 0x19000>;

will send a v3 for this patch.

-Mukesh

>   			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
>   		};
>   	};

