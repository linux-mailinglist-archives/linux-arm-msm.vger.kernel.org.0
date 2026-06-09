Return-Path: <linux-arm-msm+bounces-112114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jSqDMF/lJ2oZ4QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:05:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884A65EB23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:05:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N3wuP7ik;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=clowVXH5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112114-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112114-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DF33305BA2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCF135F19A;
	Tue,  9 Jun 2026 09:59:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B727F3E8346
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:59:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999184; cv=none; b=j+te3lMWm+JxG4spGrcqSCfy+5GC3Gql+kW61Eiuk7vjCNPo61Nt3jrKHMx2tgz848Z4we3QXvqGesPSBLCZUjg9oNWlPmO3jUUXZqB4evKZVTgMA2aScDUeUGR7MsuoHDolFEyPw13gSQRWJ/odvBkjqrrAhLPiWmIqkw5Ht98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999184; c=relaxed/simple;
	bh=BnrDNf0KyblpDzK8RL0uKrkJf8wwscJiCPoMZoRQgEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajrfz4lyf58VjxWilEMqveEbD7UlwT63GWXGgnaRhGNQNqZ1PbJURdKbk4CHljn95k9QabgfIauKIk9rj8ev9DZ/hvrR77kLR1BlW6FaAxljgkt+eJJQk2mtR4NFWeOaH/QVg2QqZwYVgNGdPpO3I5TNH2ah2PjXFhPYAZw+hO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3wuP7ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clowVXH5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599xgfG2245481
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=; b=N3wuP7ikpeNn4yvM
	y0oN9DfEotLoUMt6HJ06o0iGXDd2nxVSW9XV2lyETljaSvQHNfxD1LXoxl8yrPH9
	LxbygrHDj8/PF15RlitMEZ1bUu3Bhgu3g+BvhoQkWPtJ4i4AhvSXa2dsKz/IWs7Q
	mm8L8krl5fb1UfTQAdtgeBlR1wRIiJLJDwcUYWMgCef83GLrn6M8WCR1U9QUrenw
	6YATZ5yWxMq8V2QB6zcZAnGLyIbsorNC4OITD4sy5mVC/pWzx4yb3eJlfhIi6TpZ
	5l2llhF+aa0NshNZeKbRymhbkg7IeLn6EvLAW2k7rkaK/sYy7quGALY/DWjNl/yf
	GPg3Wg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8x3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:59:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf335549b8so82480395ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780999179; x=1781603979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=clowVXH57ZBdSIp0ThuvUqp5FpAZ3Yl4Ad5X9zGU5UIflU1h8/sxTGWxEI2GQHWaIl
         wD3yYsqU9cSJTSu2ZxwsjZ52lHYwg4Bj9oVnaa36XPJclPetFYsKom1isHljVRHlRFPt
         k8h8d81Ox1aQ/FRN5ftpxByVYFeIDEqxtT1lAAYKJx3GFW1FpHr8XkYhCsfaC4XclxF3
         eYBSLXeqnZCjfZRuWtnZMuzGXsON8aIK1hQF8b9jiaBoldcyZ+H6wLwU10BoVDbFZrGV
         PEnJHuhut8a2aC3vYwb1JVHsd+mIgUc2InVNgKD85ADP4cPe2jug12RXcP+0QPVG4KKQ
         ANcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999179; x=1781603979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCRCXBCvtK+g4473pmA8flE8eK+i+w67FZXpAsMZxKU=;
        b=TxKpAiUllKuH3AvuiGjmVzAewGQtcRJu2tmEj2e75i7G+jYIpKJ7fYQKp6WbeTzOK6
         7PzILuj1uWYJBZzXSZ9BduYrDUnXcai0hjdJCleZH4+A74r26ruEnCeQI4zqsFJk4FVt
         Saz5g8bz8CcyMErb8rk33nxAWIIlqThPnujI3P72kxiF/jHVwyiEGomjh8ii9jYRc5x6
         GMqPqP0tNpSxfbCO3BOn7WEt2XYir7zEn62LKs+bZjkhG60DEUbmXcH7Fkn6yHqZHzp6
         N8ABYiSN/5J6Va1sKRgwJPBZwLQWqvOiXnzKfyJDaxq80cD407NBDnHEASr7xl8PBG2Q
         9Usw==
X-Forwarded-Encrypted: i=1; AFNElJ8zwN3Sbko1wjmtqvr3+54H2qzhBX29qy4MfEOEqo+09FPJOgQZerI9nPK9fHPpaQxD3Jt2TbmmbzIhi1br@vger.kernel.org
X-Gm-Message-State: AOJu0YylEYsvnfVrDm8HWwmiuNUk4VsK+75awTFyxg4tqRz6PlTar/Ml
	9ZQV/JPrF3MQpUXlGhNBJhMDuA5DRIOcDrnR1N6a9tBLTxpRyNtnuM/dEPhuMXrAJy7e6/kOuWW
	Vxgvhytni0ibKfEBgjJXiZtdqf0YpbG84aEpMBgmVjMg7Kt1ZJxPAWI4GgDxw0zCAWPbB
X-Gm-Gg: Acq92OH+aCl+HSiAXSZcepE44Nj7Mi6J70BNO8gVJ8gCuO3KXP/+ZXYip1hx2jb7YnP
	RcHMC8IRzzbsV3eVODB94ORUCQ4NID1MfDDcAEGiL1VYrtf9HHT8P/bxxX5kCpPiJCyRsIv8qwZ
	tUpu23aSeq5AbDLzIRmGRTpTj430hkssspBrtyDhTD8tsbc4dQhEl/TnVD+4zhmO6YB0VewH+8B
	iBe+Qee5/jVC3grT1F8XIiieyi7bze1H9RZPcIX7jeWOQ9zVdSccuHfmPnY944qjlnB2wikDZUG
	6i/Z/HHtOoJxtaDr65GbHTC4FjTwUx8vudi1M9GNkuy5ydVeRK1G4U2cuz5s1uQsG8axWCDfNwC
	vZ0kmc0ro5jtozI25k+rul/8nAa+eKDBRmDN0zn2qqTeR1bi6z7j3YNChFjy4AA==
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066545ad.28.1780999179140;
        Tue, 09 Jun 2026 02:59:39 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr197066175ad.28.1780999178703;
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm205544425ad.67.2026.06.09.02.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:59:38 -0700 (PDT)
Message-ID: <399bd375-235f-43a2-965e-e86e041a5a7f@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:29:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
        Cory Keitz <ckeitz@amazon.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uGW3AxA2euudE90wvBXGwfovc6ZLSQHL
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27e40e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Yq6uI0ozdmgzgeLbScEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uGW3AxA2euudE90wvBXGwfovc6ZLSQHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MiBTYWx0ZWRfX0LRdSWu8HIdh
 36pzeCPC5fBZqayo+TPxdS7uJTvJLUY/loxqtI99lhSEW8uxzMO33VkqGdHQNYfn+YJe6/CXjAl
 UPL3IT5ok1GIAO3yudFNFbO93PKh0bOQkhbVtqVvOW94t8cioKEtJWav7bc+9oHoscGFX5vqIAi
 Wq2kl1xmZu9h1UFEKRP+KkhcP4eRpivK+qn0Bme0uNlScGAc7E8xOmZ1223rhsFNp6baPLOG++Y
 WBmd+ANa4gTJAulCmohNcTAABPbxLb4DSj9FV78WUyonYhJI5TryG9l4L/Rf4Bw5o6XxF7R3j0p
 KqSrbCeEfafNwtoa7to+3sbCsfZPuZqbIEaKkRZLdsYvW533DCxq9Ya+192lPm//PkIoTseXXqk
 enSYbGGr/Eg4jkBS4/Pa2iKvERlkWwee8gTkG8IZAHjtnpxYnVLUSMjef/qCaaMqVu1chFSXkkN
 yeWKsU3PMn4NPUoswUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112114-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4884A65EB23



On 05-06-2026 18:44, David Heidelberg wrote:
> +		offset = 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}
>  
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +	for (int i = 0; i < lane_cfg->num_data; i++)
> +		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
>  
>  	return lane_mask;
>  }

csiphy_get_lane_mask() uses pos + offset but the 3PH hardware encodes lanes
at pos*2 (D-PHY) or pos*2+1 (C-PHY). Fix it as:

lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);

>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>  
> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>  
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>  
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}

Also, with above fix in place, lanes_enable() can reuse csiphy_get_lane_mask()
instead of open-coding the same logic.

---
Regards,
Nihal Kumar Gupta


