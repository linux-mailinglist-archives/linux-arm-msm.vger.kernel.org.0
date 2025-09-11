Return-Path: <linux-arm-msm+bounces-73102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFADB52FAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67091188C8F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14BF31353B;
	Thu, 11 Sep 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QMO8Pg6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229A63148A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588979; cv=none; b=gNd+2RZoJndJM6hEA/5AG60s2AX8PfoHvPDfkg+41nK96bDZmURYybzN1LEDvjYBOOI3NU1JCF+SarR1cZLBaIpG2kIEsW5uyyZbPARfPwHua5pfZVmZABDWwZXKzXFqFeAOkZ0aXhlTZR+BAYK0ASUNDmNn67WiXTfI5skaOjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588979; c=relaxed/simple;
	bh=W4fkXcIzmLOrRprTfYjXxN2qVbektwruWlgyebK8YjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OobaemUCDWOjmfUVLk2Ap1eS4Y2Wx+6/cId86Pjhs76qR6dzuTiTKtur1y9MeZ7SFE5WI0xdR57/cZGjAWEcQszz7mrIwbHseMiMmpdjhHl+4Hnc26F95MvogOasc54Oxnjkz13d7dpjcQITmTwQXv+FazPymr76NoVSfxJQ+qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QMO8Pg6M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAYUXa027365
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/c7fevbFog8kBDyCouz7tNUAQypnFvG7NInPSb7vKcY=; b=QMO8Pg6M860G8kbj
	UV6WZpRJpMd9c4Y/oKzCoI5Ithvx+29NKKnnuGkWoEWiIqx9AYhwBMMgupfNJQWi
	bbwsSmU0ScDSn/xlH2ySPPx22OhlyNLt2oyotLa/ZnYuN+jZE0xQ5pIRJUivV3Ow
	grsJuUaiPFLhSaUulj+EC4JQLHZD6oAlpQT3OOHpiTpl7+w6uRnxCD+Svorcbpx+
	ioVXmZsueHLDUVWmsTAcmNDXp81HpH1eS43KPgq9PPypXy1EiJHHnTTW51XNd7wW
	og0lH55HP61wir0b8i+EzFreVHclRVX+sILRlznbQXuvRCHYi+dXOnV5tPxWQG/W
	Uq3ysQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h2bb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:09:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32811874948so559092a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588976; x=1758193776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/c7fevbFog8kBDyCouz7tNUAQypnFvG7NInPSb7vKcY=;
        b=aaQcRaTdE2kUCIAyS/VSYO4IwU/V2HgTW/zSQyxDGDbCUZyBeraukYBRjv+XkuNDQV
         mkWHpqtN0prulEGX3xdn016wVDo6SfmynGhxe5U+iXP2iBU5YDGClJMhSHb0L90xb5nL
         KwYzsOnzxGSJYfqRtch++el7H6vK42qq+FB+PNncTTcacoYUcfWna1KqEcDEXJyyUqAM
         yJr2l5N3LMsN5WM6tkhcvjO9akQazVfL/Nrq7j1tjasN21SauBkqvsdIkaMRdsfgkKb+
         lbLtU7nAXWgtuyYHnKE7tb3vOPATyzXAIZSGF0FbLAusFjUdvgV3IqCeaXfpsT5WZiti
         Muxg==
X-Forwarded-Encrypted: i=1; AJvYcCUNYQNf632f+qss+PQDM+lH0RNoORxD0KBxD+ixicOfIPCYFzbnvOJDbrtMAeenmJlDrX0+OGLDd1a1iGN/@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGY3tOBC1J29C5Q1Sh5AVhDXo19Q84o02en17iY8fOP4/CouH
	0s5ztPfyQFfSIQXQekDwdM3D2x2aEF34Vf5rBt36S21uGVGJPRbu3TbLAOk8pbO8t8AmczbntEG
	a/BZZ05g649tpXffQoy6CNtNPlOGkVfz4KszH++oO4ulQMYHy3lsTwrCEbQOvreeLRuQy
X-Gm-Gg: ASbGncv/WnO0sPuejJL6PM4VxL73KbrjqPeYtr7/6hJgvMRAMG4ABqQlI5EESj7Lty7
	/7qT1bFB8svxq5QFntuIotyo5U/FYa3RMPizXSU2VDs41UE5h++TudukG+JiDvanNAzQ4CJdcZd
	6mMrbSoPeR2+D0MIJG6NnWw2Pt2Whi4yUHF0OlaNjTBNeWcT3hy9WEyOu9SwBGWspXJVIhhhJvd
	XDzSgrnuiDwvdISwCW3AWm3PfqaMepk0rhyQwqvXgs7DFpZnhq59A8zy5OUQ/22ibCVMxoovluC
	ZjP+Ndc4Ni6mFw8EyCRjB2pymmA5l8tw411wbHJGX/IucS95LiMBzuI4NYnMrBLSu2vMjTU=
X-Received: by 2002:a17:902:f682:b0:24c:1a84:f73e with SMTP id d9443c01a7336-2517616008bmr209162545ad.60.1757588976430;
        Thu, 11 Sep 2025 04:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gZzbIf4QtTnievchv3j2VJYq6xCKNhtINNNA/tJaPCX/SQX9x18OVQGKnBiR9GN/iOsOoA==
X-Received: by 2002:a17:902:f682:b0:24c:1a84:f73e with SMTP id d9443c01a7336-2517616008bmr209162295ad.60.1757588975993;
        Thu, 11 Sep 2025 04:09:35 -0700 (PDT)
Received: from [192.168.29.198] ([49.37.133.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc6d14sm16305935ad.9.2025.09.11.04.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 04:09:35 -0700 (PDT)
Message-ID: <513a0c85-8306-4885-9825-30bf33ee9702@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:39:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] clk: qcom: camcc-sm7150: Specify Titan GDSC power
 domain as a parent to IPEx and BPS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20250911011218.861322-5-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: feaNxd_zVAbPJgVhH9E-lxpssAfLNiI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX/jPcim25LMUp
 8CmokmTFEET2wiPa40S2/3FwFV6MA7aaUH5Ik4hsU1ZoUp0hdAKWUSscPs0yN66ZDLTdfdmQRrX
 FejC9/tZaY/DPpzEukPd2Ax4d5LHnj+wQajn/i3B5oDKKpgxn4qNOv9DHJlwNYrkYioKMdoA03g
 qvEkTPTEVET2Tzd4IyA5Vgu5b3FTKoGGGQgWWwgegDA79AEyRNouEPjT2nn8/N9ujiBw5+5v8jN
 NqDl4kassaSAK3musSCW5V1b1Pcs8phNjA7zkyN8xZIjfYvd1G26KsW1dnGVhKOVTmRBkdde5ER
 P2uZtgD/BhKwsy06fEqdVNMM8n2uDlvOVh5hyjTTGMP9Ly9H3GsNtt1f2Jly1Sn0ng0QSiKwPRR
 oXfaup3b
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2adf1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=l0trHdaATao+Pp179813Xw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=N_-oEbGzrVbpv_w9NrMA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: feaNxd_zVAbPJgVhH9E-lxpssAfLNiI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177



On 9/11/2025 6:42 AM, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SM7150 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sm7150.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran

