Return-Path: <linux-arm-msm+bounces-6692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB7827BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 00:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80CB28427A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 23:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF6045BF8;
	Mon,  8 Jan 2024 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KwN6jWOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF08611A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 23:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408MqwMj023152;
	Mon, 8 Jan 2024 23:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iYqOCpb97fqnuEKeccj68V6ZJ+sZ5Ek8/7kX8x3k0Wc=; b=Kw
	N6jWOocALAyRlvH1O/cdNBi4gCq6WzzFZeufRjkWxcQAHWX3i27gF899gslkA/WN
	w3EwfvUCC89SA6wer3Gs4wh19CE5Lponjawt44lnxZQ7OiS/fPii4BIQbuPVHczX
	Axni4gFDMPR/yRSnyenfnuSSBx+UOt20xnCyHhNpaopOscqCYlTqTUk9ipFjCgrb
	+Y1REjPR1cmbZNhnWy2+h+wAgX9NDhw8FhMGSnHBkUoHxkuUWYKMuWzplPPC3dXY
	32KUo6/z341d5MSIdueYy/2qZRz1k1adMI4paYBjbq4R9mQmcs6VTD5vMeeNfbb7
	v9BKZxP9wMTYZcB4p0aw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgch520qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 23:35:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408NZvwi030437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 23:35:57 GMT
Received: from [10.71.108.105] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 15:35:56 -0800
Message-ID: <d9335515-157b-4b6a-ba41-c31ca76362ee@quicinc.com>
Date: Mon, 8 Jan 2024 15:35:55 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sa8755p ufs ice bug: gcc_ufs_phy_ice_core_clk status stuck at
 'off'
To: Brian Masney <bmasney@redhat.com>,
        Shazad Hussain
	<quic_shazhuss@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Eric Chanudet <echanude@redhat.com>,
        "Prasad Sodagudi" <psodagud@quicinc.com>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <ZZYTYsaNUuWQg3tR@x1>
 <49d85352-d022-4b59-a3f2-d8f7ef3028ac@quicinc.com> <ZZxgCKQmQdUL81pX@x1>
Content-Language: en-US
From: Elliot Berman <quic_eberman@quicinc.com>
In-Reply-To: <ZZxgCKQmQdUL81pX@x1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ETRZ0FXEe-9NML3MVs_LNNgbpoQ3Zu9O
X-Proofpoint-GUID: ETRZ0FXEe-9NML3MVs_LNNgbpoQ3Zu9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=629 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401080191



On 1/8/2024 12:50 PM, Brian Masney wrote:
> On Mon, Jan 08, 2024 at 11:44:35PM +0530, Shazad Hussain wrote:
>> I can see that gcc_ufs_phy_ice_core_clk needs the gcc_ufs_phy_gdsc to be
>> enabled before this particular clk is enabled. But that required
>> power-domain I do not see in the ice DT node. That can cause this
>> problem.
> 
> Thank you! I'll work on and post a patch set as I find free time over
> the next week or two.
I think I observe the same issue on sm8650. Symptoms seem to be same as
you've described. I'll test out the following diff and see if things
seem more reliable:

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index fd4f9dac48a3..c9ea50834dc9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2526,6 +2526,7 @@ ice: crypto@1d88000 {
                                     "qcom,inline-crypto-engine";
                        reg = <0 0x01d88000 0 0x8000>;
 
+                       power-domains = <&gcc UFS_PHY_GDSC>;
                        clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
                };
 

If yes, I can post a patch for sm8650 if no else has yet.

