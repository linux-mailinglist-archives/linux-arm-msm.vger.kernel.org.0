Return-Path: <linux-arm-msm+bounces-71010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68598B3822D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 14:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721F9189FE9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9783C303C88;
	Wed, 27 Aug 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F1xRJG/Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464F3019C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756297436; cv=none; b=fu7BnJTZdJCGU5/f8x/K02lc/C5LYytwGWlXOJ3JyE1j/pyRLKylc4tTd07M51suncFECXTAplIl8ZeF+O4v+iIc5xHBXq9iZvBQX4G0TER1z/QC91sePAkoHfvdmzke/lky80OtJGzq8RiobDTh1kDjN9cB5QYOtACzGPjzIXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756297436; c=relaxed/simple;
	bh=8H1AJtkLp2gwRFDlX1OHVsQwtabmn0YuK3YmZA8GhpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMO/l3sWgkMulN+C8C0WcW+NVOzPYjFzTK6trW80OKYLcJe0Oygda35lWLyOXGHgcwkVdh0zdxaaECfRU2hqgI6dL4O9QbcbzznOIARA3QoI2tLYCJzJagiVVpdQhhqsaV6Hkqe85mFuf/s0y1FTjzGU+p2IGMkXsrNfE4otmpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F1xRJG/Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kFcf031769
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yg5rxRbbc1HilhImNhc6AceAQ1YLgYvqFXETiddrEsM=; b=F1xRJG/Y43/PUj4n
	2qa33XazZeg/c6iTHvg2mveoPws0W9aCxxaPfgCQHoJOFROgsYN4F1U9ntwmkdEs
	ejtjAMp47VKEnVdkVCVTbAASVSZo310nWe7KM9li9tnBLvITVDNXRx+h50mpxVp5
	EcNJyo8aEmNtA21jmv8xTQ8T2+5ONunGoVzdtY1EnM8QzmZofYH5nE5M6V8jx/6z
	KtTuM7OIgpaN4XadNDLoLxMlZgOOr3gOdzex1F0mWU4l2dm1fx9jxpQG9nLxMop9
	tZPVbgzMXcRA0ksKoEDUzxEZEY4j8Qs5AE4JSiVKHC0nTyhOg4NWJs4RTobyDw7E
	10phqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpvscb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 12:23:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24457f484d6so24718875ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756297433; x=1756902233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yg5rxRbbc1HilhImNhc6AceAQ1YLgYvqFXETiddrEsM=;
        b=MeZzE9V8EzuG3msmpsevkmjERsTH+PtkScLFOGiDUrvU+GJIbI9Bs6fODNgRfIhCye
         UPvCLX3KOgl/pr3wAA4pPbBqi7cL0Uuomm5ILOuRslozGARcSQxNcu8K6PfSuvJuU7t3
         7fgzTiAwr+ModGcnkGaOGUKjVZmQhquW22ydD6Ts9d/5+/jMRcsFBntdmYoZYvIIwO2U
         sg715MiUDnOSi8uqxUfq58c7e5oVRfevrH5egrpHoa8SBNTmXVbWWT5QnNSlgvaMvbW3
         s/FaOdg7w6Eb+e4/YcFXHnFHX6r6TupojYoMP3GuG1kltE3fbFXDV12iwF2wqRupc6/s
         ud6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0Et4sAVJcErl29bGtNUc0IRjGGIhFwjzQJGPDpa7JAgL1h/xvJeDOrLMo/DhYTcfrW92LAkSZ8KUTpS5H@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq86gHJiu54EgQJCDhiWTkdQFmM22TTvhXdrnDo1ppYYytlQ0R
	AFG+zoIIRSYp/Wj9PU+G2EYaLDdSVcC7Vtk6AcqGzutVqYShLKMeqFnyPM9WGhWgxE9guuZLw3C
	ZGJwaFuXnAiq82UJBkaybExk2+0tEZl+JRLCMWOZ73y1iungFMkr1zmg0kJCyxv8ca5Uk
X-Gm-Gg: ASbGncu0yTWAmMBHjk/7XOp5DUgMfavaH/wzzwjTz8x/SV75qpQFZT5T46YN+4OG6p0
	5cBl5ETKCMGT11ywj5lTIwbm4PJBNnR+Daun4X9WfQZiysayNhByiYnszZqk29ulfPMEb7iWJsB
	NUPCUR4KODOy/9uCrUnyx0u17ewc0YUrtXwsTJGgmAmCRzGhPkLA5tfTJf0iyKlGTA+gRjcDiPZ
	+Gs2kD5jK02T8qokBXb+xVmZbjw1SwyxGpEKUaPkfm5ZN2/k3VEZMIAwVEdzoAvdzwJPPBctNlV
	dIfxh6FAuQ8Nbap6fK0Q4FmZyxYk4NumCnbixjyM2YCjYdQC62k7MK/7ljRQDhZNgCuPsCvy6xJ
	wiryswraCLfb1ip6/JgxRZUYEW1wKYg==
X-Received: by 2002:a05:6a20:3c90:b0:1ee:d621:3c3f with SMTP id adf61e73a8af0-24340813412mr15976464637.0.1756297432944;
        Wed, 27 Aug 2025 05:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4Ue3miEW/c4T5E12xCiOE3p54Gi40oJLlOOke+fWNSMS7NYIwTRSwIrKoAICZzp9mEFDsA==
X-Received: by 2002:a05:6a20:3c90:b0:1ee:d621:3c3f with SMTP id adf61e73a8af0-24340813412mr15976433637.0.1756297432356;
        Wed, 27 Aug 2025 05:23:52 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7720af250cdsm1392821b3a.90.2025.08.27.05.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 05:23:51 -0700 (PDT)
Message-ID: <08997fc3-8175-4638-96ea-ac15ad20160c@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:23:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/14] phy: qcom: qmp-usbc: Add TCSR parsing and USB/DP
 mode mutex handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-10-a43bd25ec39c@oss.qualcomm.com>
 <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <i4rc5siu4q2o4sjk3j4bex7b7qdrs26y6lxsfnike7e7kqdva3@xddrd7vowtlb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68aef8da cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-nZFuMMc53900W69ytMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LiNNBtutiy7E5a0ZnXmeFLpttfua84Ck
X-Proofpoint-ORIG-GUID: LiNNBtutiy7E5a0ZnXmeFLpttfua84Ck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1aCkeLaf4gF0
 jSSoOxo2/6u7fIEHHTMws9d0s/kF9dDuw18Y8Ega8NvAHYAsk5WZM8gwT0yLz3dWjV3TT3ImfgZ
 WViD3kL+TYdUARNeewVFAAwXKW279aG22djU4WQCyP+cCF/XUi5bcS51qCTa/rnoClpu7UQ/1G7
 sPSXBl7oPgjMRs5QuT4POQd4aHajDw7diay4FxXB5FujDbw7kAlCjlytKJdynGTywxUKV9Y8PaH
 dKJOSO/33EHe9T+QXAKLX3BkaqG2Pk+mo6mYfXORvnDzzLdAXPtvKEfXdK6AjMbeANLoTzoZcAP
 0qA2FAcqXBpVRnX23FxYeaZ3PpPMNmSvrHl+UQqpBdwKgPTj4hrOyvtO+IKirEZ9PSR3yxhTYh+
 FnzMf8RD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033


On 8/20/2025 7:24 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:52PM +0800, Xiangxu Yin wrote:
>> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>> simultaneous activation. Also update com_init/com_exit to reflect DP
>> mode initialization and cleanup.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 60 +++++++++++++++++++++++++-------
>>  1 file changed, 47 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index a1495a2029cf038bb65c36e42d0a4f633e544558..821398653bef23e1915d9d3a3a2950b0bfbefb9a 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -674,7 +674,7 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>>  	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
>>  };
>>  
>> -static int qmp_usbc_com_init(struct phy *phy)
>> +static int qmp_usbc_com_init(struct phy *phy, bool is_dp)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -704,15 +704,20 @@ static int qmp_usbc_com_init(struct phy *phy)
>>  	if (ret)
>>  		goto err_assert_reset;
>>  
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> +	if (!is_dp) {
>> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
> Why? Don't we need to program those bits for DP PHY too?
>
> If not, move them to USB init call.


For these USB3DP PHY series, USB registers in pcs_misc will don’t affect DP. 

I’ll move them to USB init call.


>>  
>>  #define SW_PORTSELECT_VAL			BIT(0)
>>  #define SW_PORTSELECT_MUX			BIT(1)
>> -	/* Use software based port select and switch on typec orientation */
>> -	val = SW_PORTSELECT_MUX;
>> -	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>> -		val |= SW_PORTSELECT_VAL;
>> -	writel(val, qmp->pcs_misc);
>> +		/* Use software based port select and switch on typec orientation */
>> +		val = SW_PORTSELECT_MUX;
>> +		if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>> +			val |= SW_PORTSELECT_VAL;
>> +		writel(val, qmp->pcs_misc);
>> +	}
>> +
>> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
>> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);
> Write this reg directly from USB / DP init.


Ok.


>>  
>>  	return 0;
>>  
>> @@ -733,6 +738,9 @@ static int qmp_usbc_com_exit(struct phy *phy)
>>  
>>  	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>>  
>> +	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
>> +		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);
> Why?


Since this is a switchable PHY, it makes more sense to set it only during enable.
I’ll remove the TCSR handling from com_exit in the next patch.


>> +
>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>  
>>  	return 0;
>> @@ -1045,6 +1053,17 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>  	return 0;
>>  }
>>  
>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
>> +{
>> +	if ((is_dp && qmp->usb_init_count) ||
>> +	    (!is_dp && qmp->dp_init_count)) {
>> +		dev_err(qmp->dev, "%s PHY busy\n", is_dp ? "USB" : "DP");
> "PHY is configured for %s, can not enable %s\n"


Ack.


>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>> @@ -1052,7 +1071,11 @@ static int qmp_usbc_usb_enable(struct phy *phy)
>>  
>>  	mutex_lock(&qmp->phy_mutex);
>>  
>> -	ret = qmp_usbc_com_init(phy);
>> +	ret = qmp_check_mutex_phy(qmp, false);
>> +	if (ret)
>> +		goto out_unlock;
>> +
>> +	ret = qmp_usbc_com_init(phy, false);
>>  	if (ret)
>>  		goto out_unlock;
>>  
>> @@ -1103,7 +1126,11 @@ static int qmp_usbc_dp_enable(struct phy *phy)
>>  
>>  	mutex_lock(&qmp->phy_mutex);
>>  
>> -	ret = qmp_usbc_com_init(phy);
>> +	ret = qmp_check_mutex_phy(qmp, true);
>> +	if (ret)
>> +		goto dp_init_unlock;
>> +
>> +	ret = qmp_usbc_com_init(phy, true);
>>  	if (ret)
>>  		goto dp_init_unlock;
>>  
>> @@ -1467,7 +1494,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>>  		qmp_usbc_usb_power_off(qmp->usb_phy);
>>  		qmp_usbc_com_exit(qmp->usb_phy);
>>  
>> -		qmp_usbc_com_init(qmp->usb_phy);
>> +		qmp_usbc_com_init(qmp->usb_phy, false);
>>  		qmp_usbc_usb_power_on(qmp->usb_phy);
>>  	}
>>  
>> @@ -1602,13 +1629,13 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> -static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>> +static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  {
>>  	struct of_phandle_args tcsr_args;
>>  	struct device *dev = qmp->dev;
>>  	int ret;
>>  
>> -	/*  for backwards compatibility ignore if there is no property */
>> +	/*  for backwards compatibility ignore if there is 1 or no property */
>>  	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
>>  					       &tcsr_args);
>>  	if (ret == -ENOENT)
>> @@ -1623,6 +1650,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
>>  
>>  	qmp->vls_clamp_reg = tcsr_args.args[0];
>>  
>> +	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
>> +					       &tcsr_args);
>> +	if (ret == -ENOENT)
>> +		return 0;
>> +
>> +	qmp->dp_phy_mode_reg = tcsr_args.args[0];
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1665,7 +1699,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = qmp_usbc_parse_vls_clamp(qmp);
>> +	ret = qmp_usbc_parse_tcsr(qmp);
>>  	if (ret)
>>  		return ret;
>>  
>>
>> -- 
>> 2.34.1
>>

