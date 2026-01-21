Return-Path: <linux-arm-msm+bounces-90062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AR0DPEccWmodQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:37:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD5F5B5D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 19:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B17182CD29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 17:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1788133FE08;
	Wed, 21 Jan 2026 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+smpT2C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuyBLEdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A274322B9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015026; cv=none; b=FExDmz11OAch5C4GcL9jHdvwvACnSHUnumS4GmSJevi4BZw+OnXbAP5LjcH1BkhgFkZYRpX/B92p9yKc/hgjO5QiWeyNpN+yd2jX4mOXl3hT90Suc1qYB7B7DuQgROj2OLpzKMtuPl+lUWcnIrsND0xeWIxK3Tw9egmxw6HrfU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015026; c=relaxed/simple;
	bh=fjO9j7NpXzRG+FLDAkh6xibgdxMTf2nhnI7rVklt++k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oliQC8/6+YODo+j2CcGjDP5qlGXizsxh53H4GqQ4JAwAybkyu5r0+cpSRzk/AXbsoN8ub0Ai5gaLmTuCiHxE06B99/hw5e0f/V3BT5X2kyH4YC0yyrybWqjcIXQAysDbmjTr8uWpIgv7ghz8bnx3u6y3G1Ab7w7B/NoQq5rfS38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+smpT2C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuyBLEdu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LCxuoM3217505
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=; b=V+smpT2C3bou6vMz
	nejqxUycDfXNgosh18b0lOPk+tmnrcrEyr1ulA1BswBDuXRvgI1LOtS0O8TzT17a
	7aSs8mlOrGwHtml3NepDy7KKfh7QKkOtIbVHMv2BOC9bBo4GdJgM3Yh6kH5Ca14c
	n+tsC5xRJlTe/Uktyu7oP6gC1Kp0Zq1284J/GIv61IEuqAeRO4f6+7R72YFjFuJv
	C5/qbq+gDdz5aeYy5u7F5ylMn64bSXhgb5OQWfT8fPQ3Tn9kdaai+t80VM0HDldE
	kQKwY3vbbTj/B2pih37cBk8uReW3Rka/uQyfT/K18v2oMcH/VQ6GIRHHcfMO5JYi
	V+cOEg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btya28uh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:03:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ec8cc7d99dso10506137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 09:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769015023; x=1769619823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=;
        b=XuyBLEdu97I2hW8ghKjB7XkOvQOXP5OLd64bZFpylmAGrko9SE+1h4q5LeS//SbNTk
         TTQITa+oOeKzdw4MMwUVMNf6Txkqie/VegeTOS6KD3wGEYV9GtitNKxgOHoWJd77M1Oi
         odVKDUvsZmCOXCoqzumtPdcDo+Ralt42+lEcI9scOIeC5a/IKlyFnYjBIRXkjKP5Xepy
         ntSsADDMBwHZMuFNMpFhUzyp15FbhUn31Rgb6kSid8QP8g2c+LJROpTIY2PJ3L973kl8
         DMFSUO344CPvILhn6kZIguziuNyeTCa6ajuku4YMFDxXy18+3LMYPHcWvPgS7CRJLmRp
         Gb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769015023; x=1769619823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xE6fvhDYaR5vEy22iV+diftMONfSSkqxS8Q9Xe9dHM=;
        b=Xu2NBziVV7uHto6CczuBm2zkqDcFoxXvt7jw2tcvJIBbCVSP3WHUzhpdakIS4yIhuL
         Y2K+w6j4hf9/+8QqPSHtAMfFWBqwLJ547e83ntliNFzl+Nfva4LgpbERt5aUDQ4soF7X
         gyHTUYASWC4vJ/ysrOPERyN4oAs3aoNVDqEH2OHzrx7b/fGdqaMFRRGEAJvouyVWKsk4
         VnrDN7C5XI31W12qJHdqKT/4a+7XqfJCuKTL6JGlMRBUlBrpHbSpcqG3G7vovCZ9uZTz
         tobJfkivRDyVKgay9Gm6gLkd2ofmj4OpqoduzkXB+Tt21jAGumUmYx2D/WPCtcQ4QEPB
         7xlg==
X-Gm-Message-State: AOJu0YzXlclb0n4sBMpzz/TgDEI/vJ0FPUxS8PdCnVkCJhVBliK17iVz
	f+8ScnqpcnjTgv4ii8Q+k82ufW/kwHWw5ASZfn1rpUC9pujUORii06rKtIiMFuZenRePlr9KMHs
	6i9y4jhukeLQqQNS2uMxQibMbma7I4HJDYp1CDBU1OsPUMUJnAzcfi3hkMt7rgINUwI1k
X-Gm-Gg: AZuq6aIe9Bh7ZCm12mySEIXh+wmo5NYn9VPW3oE5gieINq5UwZK7lFiS1PSiO4LEtcU
	75FzMYRWJ8jNNhFsUGcg0unFmi7gzqDUPMdojOT8ldejrd/e8kB5K5RrklKFsTnAXtdqUMUb6Bl
	jkK9ApadfXzSwdJl1aeAhhnOoV/5gpaD065X+Jdz3Vzcv26lCwAANHV/H2KB750iepr/WRYteW+
	6ufDwexMkz4WZ+9ulstuHA5L4pIPTPMIWT4BF6V8qloqHiOxQ9gVsbO1kzLSSYHsVPwcVrG1QXX
	023D/n2DB90AVLm2xf06mqldAhlu7yrvtErOx/1UgS42nOjlOyFvrgfxFCQm6Zm9kNPSRBBs3ES
	gjAi6gkLVbPGTKdGWpBx3Cv2WCqFVLWKHYpIiC1kvyfnNOZesAxQmgrSy/T0JcJGeu80=
X-Received: by 2002:a05:6102:5ca:b0:5f5:2b1c:7549 with SMTP id ada2fe7eead31-5f52b1c7713mr238030137.4.1769015022252;
        Wed, 21 Jan 2026 09:03:42 -0800 (PST)
X-Received: by 2002:a05:6102:5ca:b0:5f5:2b1c:7549 with SMTP id ada2fe7eead31-5f52b1c7713mr237977137.4.1769015021280;
        Wed, 21 Jan 2026 09:03:41 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795169721sm1611734666b.24.2026.01.21.09.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 09:03:40 -0800 (PST)
Message-ID: <678a9105-663d-481f-8286-f74762e09e8f@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 18:03:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: pm6125: Enable RTC by default
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
 <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-5-fb3ee94922d0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=epbSD4pX c=1 sm=1 tr=0 ts=697106ef cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=7acBLAuPG5nW9c0efqEA:9 a=QEXdDO2ut3YA:10 a=fFR93BqyA14A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: DC_-IJbtBKVbGhxLW4_mkpqY6ibhBerE
X-Proofpoint-ORIG-GUID: DC_-IJbtBKVbGhxLW4_mkpqY6ibhBerE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfX1Ko7gNv2uRH4
 ouHymzA/trc/CMrD9lDw+nCMT6CfCy6jYyiPHTXbsyDwz2aXheTsJZ//SKl9G0boO2nrIL4RHqi
 sPM3UDaUb1SPCNDAtuQr0llWeaHLGk12s8Ch/oRurP8VI2Zpqcm4IdaFKOgjya3E37GKJcJIbsQ
 j5GHrRIqzNATtsqWJm3R8LobdrGle3ZHF4c7wyVNLREe+8tyRqyzJif1BKk/U4u6f3WDobswby3
 yECqMVR0osVZQHod7ttbiy9c7qtIBoqcpasJBIAQQk5q0NVgJDQ/4pblUDiGZzPLhEHV+EWzgkj
 STj7FIyPDuv/DYTZrVQl6mniM9R4K192YNY/9807zV8RBT7YBoVSSvVF3tLIkDSbaaBeTy2hP/F
 yiUQCuTGZ1MdT+K1uKgLgff+PIIlhYaL4YdlXpsx/7rsr32sHCluXVSKYJV/ss/nYNipNkgrg2g
 FvL5WsOVC9Rn5MnfEPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210143
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-90062-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBD5F5B5D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 2:26 PM, Biswapriyo Nath wrote:
> sm6125 soc uses this for real time clock.

Bit lackluster, but I suppose it does contain the "why" for this
commit..

> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


