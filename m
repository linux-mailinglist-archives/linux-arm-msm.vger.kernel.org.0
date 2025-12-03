Return-Path: <linux-arm-msm+bounces-84209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E709C9ED2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 12:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 329A0348069
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 11:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01BB2F39A2;
	Wed,  3 Dec 2025 11:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQCgPWQv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9uijCDO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36CD2F3C22
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764760507; cv=none; b=kQ3g9HLQdE3DpSYWVwULu+TpfhzjzBSe58XPNfyBC6iFBCeCDsBx/XIn0NMBFscV7nxn/DpSqDokenJAuRSDZAco4r1F6OJmjBI4Lz9j97DHmqfcXUqrOvqUeq9nSUxpTsOJzC0w3eMQkgOe4dRBVbhgJLiZiKHkB8LDHQwLwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764760507; c=relaxed/simple;
	bh=eP3tDoyJEn0q53WmiKkuekFIADve/lQCRcyXrA578eE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dymRTspUjdjpwRr8yYiYFgb5C4qoWtoDGJtDToUuJ5m7Kkpb40RAV1PUbVuDAVOlakg7uJX58jdEcp05Vl88HKYltRInkg8ySdhFkLy6qSQoiLiruUHzbD+Ol/+8T1xqroPbmW5do1opHHS2jdaOD4rBbzjRYSz7Ndnb4x8ncbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQCgPWQv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9uijCDO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37Xa981901723
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 11:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sx0Sxi7RaZ5r/OLiymcootGTCfaloJHP1I/EOtGg0NM=; b=QQCgPWQvik8a3OvJ
	zv2UkH1ULms9JrlI0S6j30qdHpunRKda3yT5RSVV4gowcy0NTV81vpgpP6U+7J5D
	dN4wtUgJcTL71l1Y7ZEH+ZEP3ffBfBfgT8kdGSIXBSDF3R3QDoWblZGKSQ/FdJ4G
	MqSGs5ow2zzlIXkBCl7cj/eG/EVlzwjRpu40ljuwlHEisFF899HKWa72naXQHXD9
	Qr6swy0T67BHBTOnpTmqJFdAp2nRTH31cnVoa+gb7GJ5nHbkC4p8qnpgGlq5hfF8
	f7RzjZv+d9pFvQytAu02QNhuvGUcLbHhPrUgTwKeoo03e67DQxff+/vjYZtUfMHH
	4MliyQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atgx3gqcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 11:15:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6a906c52so13232391cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764760504; x=1765365304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sx0Sxi7RaZ5r/OLiymcootGTCfaloJHP1I/EOtGg0NM=;
        b=A9uijCDObmxJsyhlGMFfVHNWQQV5vfqwOmBXIx8Xr+wPy7JS4maUWj9h5ulooxhOLk
         aebFCwI/uQ/cNhePoHGarLimKKZjfzYvaFapVi18hjNEeS/sRmX+zYUkuBuce/IpS63d
         rm5gKrb3uPu/sbw/HCFCXBwZtHA6qwYyrOz1v7eMxNE/Nehxb/SMMOoZuGUpQFGSwQzx
         uzDuTFiKIL4v4G2Qy8PnYMovKMlVQD2uFxcY8yYDOjAP1PyeAUJlnmD7EH3MT3xxze2D
         sszJJ0prQvLSXzfKIzlwohSWX3UUsGnZz9WdJX0C5cdv3EK2xxtXdZu1sP8VLI6NbKU+
         i/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760504; x=1765365304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sx0Sxi7RaZ5r/OLiymcootGTCfaloJHP1I/EOtGg0NM=;
        b=bK/mqh4q1wnF3Hap2pHrmPkEPQ4WaKe45Ha4keJdzXvqrlR10y9jTO7lFHLGMNUjsF
         U1lbpKWNbigptSNps4jUjd+OFjtOFVGQ1cIvzyJJ4fcEMid728VhuWyk7knToNAen4YB
         Xojw2424ht6R0LMx1lqszfvtAlG95jEjDey5uJEggIOpvgFptHy2E+zH6YHVlwvu9zto
         JzUNpWlz21v/qiHkYrd4iiQ7U0eLXIT9X0TwuBNhL56/8+9cJus8z9z6AvT4ZqxnPVUA
         L1locZ48AoHmV/JLPZZxgyTWSCdlzYzRm3f40ZH3cEhlzYzSdhdyeTptyuby3iaSYXVP
         fS1Q==
X-Gm-Message-State: AOJu0YwI+0LAS0DTSoqukI8DOMgx4qI+9cYv5nzWMnLEnzS0a29nOd3i
	j7bBqbkWfvhpkHu1g+cFHkBSbFgjOFBMfAiLNkW0HB8ZGkZZ7Almb5+EwN6WxgH4Ju2Y7f70iSX
	SeCApSt8K2rC55nThJGEPz7HBviue6CIF0mySQdDC8poZdFSWq4Jgs2u7A1rzmph/DqDJ
X-Gm-Gg: ASbGncvlMR8mzhnu60HKR3bGQJ6l/25vKXpGRk9u4iyaIzWA6iXljKfhaIipWb8UPaU
	s6mNgZyTJfhDp/Te1p4XfeKhVgd8dNUFGr/7rYwVp4inus2PgNXktAnaOLfNB+hAdgDYuTo2DTg
	qscAd/2LIX9DuRX0ZypRdFksg3WdqR6X+K29fm5AgJa0at0hz0WlqZ6QNAEnBY7WHESlYIx1Fve
	vEnWhGUXWHyne3HyAZPwLhex53hQoJ+ei4aQPKkbd84U7MvUILIADZ22X0+dKIYj/DXTsQQgxPU
	nZOPGaum23k4zq7NmnVyyPBCZMEoXKrlOL0NDPLyR9vsH3tyO6vZuUEpWrLf+rdWqs6QH8OC9P8
	9am5SehzGMvEB+wedLgPL5k/wFT3Ga9ivdtp9pO7I10Jc+8spTgvA1jj0ToFgp8uV7w==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr17307951cf.11.1764760503995;
        Wed, 03 Dec 2025 03:15:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuDgbijKKd62ii+mc6Bi9vpnrCyOLqg//ZpBlxTts37lCeH5/k75isDDIk/xGo92WQ15EXpw==
X-Received: by 2002:ac8:7f54:0:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4f0176844ddmr17307571cf.11.1764760503486;
        Wed, 03 Dec 2025 03:15:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59aed2esm1781866066b.42.2025.12.03.03.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 03:15:02 -0800 (PST)
Message-ID: <fe15827d-c15c-4b4e-973e-3cc379714467@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 12:15:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qualcomm: phy-qcom-eusb2-repeater: Add squelch
 detect param update
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
 <20251203083629.2395451-3-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251203083629.2395451-3-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4OSBTYWx0ZWRfXwJ+25GGIUQ+L
 qupuJAKF7yHJ4+Wgh6dkt/8NlazO85F8y9HblsR8FeiM8iQ49JMaA6YTRGJzmhOkR3IBH/8r+lW
 Te4ElKdpi3S/owDGlbHAg8WOpNjokx7MEL6xvpdU9Lgg18ZAdjRreyfTDJI85CZsOdqYjK2UmJn
 2+vTsy7edvTBjXQvTAgpSGREj/pU46q0JLQISHzzDiTZquzbh1hw5KsbJfMNslzl9HxOOjLMET2
 9np3j03nucrvM4JpVU500ZKvNqkf0FwnalL4spwjTlelBFfWYVf3BaabotXe82cqK093VhnBL7V
 124ulxlGcMrVXGTFGnIlYOQNJ671DrMy3kRE4yyvyVFB13wJmG4nExVG92tChvYxuSP1WA3vWAF
 aDqx6TzAAHv+VoafTxscbcdZ1NNQVA==
X-Proofpoint-GUID: lOkoiGbWU4oOJbBTmdS0P3cHpcZBo5-9
X-Proofpoint-ORIG-GUID: lOkoiGbWU4oOJbBTmdS0P3cHpcZBo5-9
X-Authority-Analysis: v=2.4 cv=R/QO2NRX c=1 sm=1 tr=0 ts=69301bb8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZrT6FAlEKn3Pr7If_u8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030089

On 12/3/25 9:36 AM, Krishna Kurapati wrote:
> Add support for overriding Squelch Detect parameter.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

>  struct eusb2_repeater_init_tbl_reg {
>  	unsigned int reg;
>  	unsigned int value;
> @@ -120,7 +131,9 @@ static int eusb2_repeater_init(struct phy *phy)
>  	struct regmap *regmap = rptr->regmap;
>  	u32 base = rptr->base;
>  	u32 poll_val;
> +	s32 dt_val;
>  	int ret;
> +	int i;
>  	u8 val;
>  
>  	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
> @@ -147,6 +160,14 @@ static int eusb2_repeater_init(struct phy *phy)
>  	if (!of_property_read_u8(np, "qcom,tune-res-fsdif", &val))
>  		regmap_write(regmap, base + EUSB2_TUNE_RES_FSDIF, val);
>  
> +	if (!of_property_read_s32(np, "qcom,squelch-detector-bp", &dt_val)) {
> +		for (i = 0; i < 8; i++) {
> +			if (squelch_detector[i] == dt_val)
> +				val = i;
> +		}
> +		regmap_write(regmap, base + EUSB2_TUNE_SQUELCH_U, val);


How about:

if (!of_property..) {
	for (i = 0; i < ARRAY_SIZE(squelch_detector); i++) {
		if (squelch_detector[i] == dt_val) {
			regmap_write()
			break;
		}
	}
}

We could also validate the value (if none found but property present, error
out), but the dt checker already lists all the available values so that may
not be necessary

Konrad

