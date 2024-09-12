Return-Path: <linux-arm-msm+bounces-31594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E884F97662A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 11:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65BAD1F27794
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 09:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FC619E998;
	Thu, 12 Sep 2024 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZbS1SCKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6881917CD;
	Thu, 12 Sep 2024 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726135049; cv=none; b=PB1mbd3AJE0t2GImBustqylTmWhZnFZD32rn6nIUBcGDYmBOCtINrWFRekfmm05VaDticKq26wJpf5PhyVG2wQdxUA34nt4j2vG9jMXzJhJVnrTahbhid43egCluI0WkJpP/dVL74NfPCNQN4lx702HMIvV+2RKxk36LX6pgMac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726135049; c=relaxed/simple;
	bh=pBnPwNI6KYZCCeX2o2ozQjxhO1ko1deI8sK2Ps3xNok=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JS8Q9qDYwLse+fk5euzRrRcE7Z8hmJQKu28Nd/dZ3yXi3PWf6AM3lZ43w7dDsaBLbtM16yR0tJubdBl+hPAImzCgWxzu5iNH8JopWd4r1ozODYgZAhLxmzvEVNisZvOtk6DCRdVf8nKUF5TcBKD1BRx57B+8LTn6ZTppaweHnkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZbS1SCKR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L458014088;
	Thu, 12 Sep 2024 09:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QPAhKrtQYIasF68Ssl5Mnv7LAU0oTBN2QAQNSqhxmk=; b=ZbS1SCKRsiVNql3q
	K9EnXb+nHT+i9UrCDDrd99cBRYWC7UBlFU9wVPiteSB+98E4tmUMWptRxtGNHhcg
	fvcw1UIFFWujVMHO8zzFLR6605eurLkDDPr0YodpiI5rOWXRt66057Q874trScFD
	lRHTyrUmQiFBL7YmcIGpevb7x8Hc7AWOvo77tU4yOBrprynGluIu5bRKyUbJXLFr
	2ntD5f4PWmHFxJI9NFPPY1TG4UxCmZvujI2t9XJYHVw6ChFh8r8uUsQfYTvqeDzj
	FkOJ/STf4GGTG4+V0SLC2iHolsCYOgI0+1QSLjhg+ASIrctxVd35E7zMkyF3N+fS
	uhV8Tw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy8p4sqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 09:57:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C9vBg1002912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 09:57:11 GMT
Received: from [10.204.67.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 02:57:02 -0700
Message-ID: <9cf67bc8-d567-4fbe-af77-bdc79f74fc0a@quicinc.com>
Date: Thu, 12 Sep 2024 15:26:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <konradybcio@kernel.org>,
        <andersson@kernel.org>, <simona@ffwll.ch>, <abel.vesa@linaro.org>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <quic_khsieh@quicinc.com>,
        <konrad.dybcio@linaro.org>, <quic_parellan@quicinc.com>,
        <quic_bjorande@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <quic_riteshk@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
 <20240911100813.338-4-quic_mukhopad@quicinc.com>
 <CAA8EJpqurbPKjmRH8zdqPkMuze4zwJVu+=W0nP=Ldc6o_4Tu4w@mail.gmail.com>
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
In-Reply-To: <CAA8EJpqurbPKjmRH8zdqPkMuze4zwJVu+=W0nP=Ldc6o_4Tu4w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HBOVyAdpivXZcwafyU0DnSmEZOsifBef
X-Proofpoint-ORIG-GUID: HBOVyAdpivXZcwafyU0DnSmEZOsifBef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120070


On 9/11/2024 4:10 PM, Dmitry Baryshkov wrote:
> On Wed, 11 Sept 2024 at 13:08, Soutrik Mukhopadhyay
> <quic_mukhopad@quicinc.com> wrote:
>> Add support for eDP PHY v5 found on the Qualcomm SA8775P platform.
>>
>> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 47 +++++++++++++++++++++++++++++
>>   1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 0f860a807d1b..34a47cd2919d 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -191,6 +191,45 @@ static u8 edp_phy_aux_cfg_v4[10] = {
>>          0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>>   };
>>
>> +static const u8 edp_swing_hbr_rbr_v5[4][4] = {
>> +       { 0x07, 0x0f, 0x16, 0x1f },
>> +       { 0x0d, 0x16, 0x1e, 0xff },
>> +       { 0x11, 0x1b, 0xff, 0xff },
>> +       { 0x16, 0xff, 0xff, 0xff }
>> +};
> Same as v4


Yes, we will reuse edp_swing_hbr_rbr for v5.


>
>> +
>> +static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
>> +       { 0x05, 0x11, 0x17, 0x1d },
>> +       { 0x05, 0x11, 0x18, 0xff },
>> +       { 0x06, 0x11, 0xff, 0xff },
>> +       { 0x00, 0xff, 0xff, 0xff }
>> +};
> Could you please confirm that there is a single value difference?


Yes, there is a single value difference.


>
>> +
>> +static const u8 edp_swing_hbr2_hbr3_v5[4][4] = {
>> +       { 0x0b, 0x11, 0x17, 0x1c },
>> +       { 0x10, 0x19, 0x1f, 0xff },
>> +       { 0x19, 0x1f, 0xff, 0xff },
>> +       { 0x1f, 0xff, 0xff, 0xff }
>> +};
> Same as v4


Yes, we will reuse edp_swing_hbr2_hbr3 for v5.


>
>> +
>> +static const u8 edp_pre_emp_hbr2_hbr3_v5[4][4] = {
>> +       { 0x0c, 0x15, 0x19, 0x1e },
>> +       { 0x0b, 0x15, 0x19, 0xff },
>> +       { 0x0e, 0x14, 0xff, 0xff },
>> +       { 0x0d, 0xff, 0xff, 0xff }
>> +};
> This one looks fine
>
>> +
>> +static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v5 = {
>> +       .swing_hbr_rbr = &edp_swing_hbr_rbr_v5,
>> +       .swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v5,
>> +       .pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr_v5,
>> +       .pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v5,
>> +};
>> +
>> +static u8 edp_phy_aux_cfg_v5[10] = {
>> +       0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>> +};
>> +
>>   static int qcom_edp_phy_init(struct phy *phy)
>>   {
>>          struct qcom_edp *edp = phy_get_drvdata(phy);
>> @@ -520,6 +559,13 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
>>          .com_configure_ssc      = qcom_edp_com_configure_ssc_v4,
>>   };
>>
>> +static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
>> +       .is_edp = false,
>> +       .aux_cfg = edp_phy_aux_cfg_v5,
>> +       .swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
>> +       .ver_ops = &qcom_edp_phy_ops_v4,
>> +};
>> +
>>   static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
>>          .aux_cfg = edp_phy_aux_cfg_v4,
>>          .ver_ops = &qcom_edp_phy_ops_v4,
>> @@ -1114,6 +1160,7 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>>   }
>>
>>   static const struct of_device_id qcom_edp_phy_match_table[] = {
>> +       { .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
>>          { .compatible = "qcom,sc7280-edp-phy", .data = &sc7280_dp_phy_cfg, },
>>          { .compatible = "qcom,sc8180x-edp-phy", .data = &sc7280_dp_phy_cfg, },
>>          { .compatible = "qcom,sc8280xp-dp-phy", .data = &sc8280xp_dp_phy_cfg, },
>> --
>> 2.17.1
>>
>

