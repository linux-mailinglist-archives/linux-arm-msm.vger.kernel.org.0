Return-Path: <linux-arm-msm+bounces-62804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB41AEBA0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B773A6628
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D2D2E3AF8;
	Fri, 27 Jun 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+KdFKpk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4157F2DD60F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035193; cv=none; b=Jko83YfKjJH69CVvlvFR4MMlooKhIV29PTDPY+olzgd2x7EIp27YVw0y8THG0b0glFE8n5BckjIkZKR8bjc6eUenxpjO5RyrUTcHfJO/n4x8W8uQUiF/rB1rO11ZZ+Rv4rU/C/mTCJPOqZT/6lFlK8gwAexWbOKaF29USODpv6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035193; c=relaxed/simple;
	bh=jSO/+p511lq7EpHwGud3WAQSg48s7MPXrdiF0+DnpSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsEoyRDD/sPuM8UaA2PBrQX6Pi6Tej6gouOzer01Q1kfCm/MWXW8i/WZ3RVD2UmlGlq8wdmQGRTPBOvvRc8bTOOMqGAQJi5rIBkqxgRxGWW3Jb0RUmYGyLGKVKAKYr1LQ/MvO4ycAyiYYqY80gZIGx+0l9idb4bQGq3scygw7fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+KdFKpk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBmNPs027380
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6++o7Pi5HATRG1pqFXN6d7dbC9+DjhCsOCIwbyrPwyI=; b=D+KdFKpkSvnDfzON
	TpIX7qgNXw+GbKrSIp6ptQZwAzEtCSwMPqca8H4pA10ya5zWiD4DuJj4SsfJxlaz
	rTgBiidMeN1bmoViCfnkPHe9orFxymVRbD2IJU6oguUWowhp2D/WTr1Xdnd5OIOr
	w3BqMKKMjWZzMXMK2EDwmfQmAe+gFnjiZWBdWboaWcCu3cHY79crZR/pEzlUYnvw
	+ZrkTL6PCQCDlkgPqBz/B+VsmPCmD791WWiW0hFyWNTATU5dHen0T0+NcZAprnih
	JP9wErwOodnYIhqIAB98Pg1UAr8XiodFLFqz1Pv3Nf3z9Bowple7EMWZawljQfUt
	BxkjcA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26hjgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:39:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd1dcf1c5bso4342076d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 07:39:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035190; x=1751639990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6++o7Pi5HATRG1pqFXN6d7dbC9+DjhCsOCIwbyrPwyI=;
        b=sDaj/m4h0kwTJQGE3TbsOZbaCcy0sgvqqdn97MpOUtn5Q/MVzd1FlrbYmu6jwuBl7t
         I4GFeWuyNrw8TZ9ZeerrrV22dgx6IczA2rNDBEvFEBy9XzrbOGtEh4FbdVhE8AK2/erm
         AnX6bispUx+wXWGAAvSRXuDjZNuAMjQv/Fb5/rTZ1qhIXCMue+zLlr3jdoxoLxe3LWwE
         kS6pVE73w9IuN2yo0Sma8JdB5mJ7LSe17I2qJIf3EqCwakArI9uUL8I9jFwSrfKc1Hi4
         s8alfB0zfnfUB69OaYAb93Mt1+U7cXia1DHIM7h/D7gqPQUiyM1Je11rhJaHTzPzeaxa
         dhLg==
X-Forwarded-Encrypted: i=1; AJvYcCWMhIglPwcxOiDZ+dtO3A3I95HgSOLd+6ECJXiFObl0FtaFiYb7DfFMp8dZYpDmZlp0a2I8GKpevo+NkIxM@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV14AgGzdc/vsQn21xuO2otAHmAQyGDZr7n9NssIhcfQj9P8l
	VeqDYVyTNHrsTloRZeuaoWwuzMIfgpTs7gnDhSekraE9xHB+zwG9sl2HrTNB/zdsYnZA39MWW9r
	/y1AOKCIBqjripeZLGPltpbCa+xbuUWGHcQkksMtv5TrEoR7JZhy6eb51u7zFKLQczJ0k
X-Gm-Gg: ASbGnctn8VcRFaUS6O0dw91gMMHKxHpX9OpM1rw/lDpGyPRGSQ+C+qShqWG+saAZAus
	IErQc80jvrVLUuRoCk8VuoTgkazZT4vsjGEtouBXlgJgYEPxmrGaBdbglQhfBWTqMuk73a65ufr
	otC0mGAyEbUCo6Fo8TFs0rGTnCcEncXsajXtMQLmZ5EjNWMyB7YSg1flXRsqpeUCHcFEA9VfcGS
	2K5LBs/+bNYTvaxFV8AdAbmtbeJ0dQdKJAgKRvHL0L2FdAVRdJrq4zQu+gfHb5HA4EEDH00ci2g
	jRNQDAhez2hwpxh7gc4vM4bk6BFvRA1fjmjJYIzLtmbRjzPNZMF1jKKGA2aOWx/GHpMbxXVWtXW
	sxlY=
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr23642541cf.7.1751035190093;
        Fri, 27 Jun 2025 07:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuy8/AffggdD2ijir7SSC61h9ZP3G9ScwXgZoEL4giSxm2FwpM/5LVBxTCOJODiCEQ/gqwLw==
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr23642401cf.7.1751035189635;
        Fri, 27 Jun 2025 07:39:49 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363aed9sm133238466b.24.2025.06.27.07.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:39:48 -0700 (PDT)
Message-ID: <b7759de3-4701-4bb9-bce9-1dcbacb13265@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 16:39:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: prevent garbage on serial
 port
To: Casey Connolly <casey.connolly@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250626132333.351351-1-casey.connolly@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626132333.351351-1-casey.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDExOSBTYWx0ZWRfX3rzcNvVFO0Vs
 l+zhvIj4h8f7a6R3svHVxAWEF44ObBGjmLUcR/1mNAmk05BLaRnrgLtWolUViNHg6QzQyAk9Ztk
 ikm0GUGbIkp/Wi7XoB2COeW2zMSJKsnEwLCIEJxr2nGrTqnXMlJaosu7aIRvxZ4s9CLzF3flxbi
 D6lpGkmc2bnDD8sK5X+ozDjzzUQzARFJp1g9pSIupRu0eWwdCncAzzPJ0N5rfIJJyqj1h4F4mVl
 w2T3MzIlvq/kl2x0SCRUqf6dK1+caNM2j3f/PHL6y3xGq/TeBSUzCIRZpErtqko/Udqlym0fMCE
 hfrq9yIyiwLixpMzNXs+9Oh58To/Ywf/ry4Nxh46fOXaKJbMbXBQJ8wsY3pzAI2oAbN7aI0ELv0
 PdzY0dziyKQk2m2MRQeXs0ms3JLs6JI4MsCnu69a+dZKS2N/nrg7UtC2C7SkOba9rdO4RCwf
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685ead37 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cEcZy6ERZyJA_yEnOZsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WjNLd2wtxeiNmvG8ror5-Du6oTnaDX60
X-Proofpoint-ORIG-GUID: WjNLd2wtxeiNmvG8ror5-Du6oTnaDX60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=843 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270119

On 6/26/25 3:23 PM, Casey Connolly wrote:
> During early boot phases there can be garbage characters on the serial
> RX port unless it is configured as pull-up. Add the pull-up bias and
> mark the rx/tx pinconfs as being necessary for all boot phases.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

