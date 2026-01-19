Return-Path: <linux-arm-msm+bounces-89636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B220ED3A737
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1073F300898A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5CB318B91;
	Mon, 19 Jan 2026 11:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZasSyb5P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UY5LYxum"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFFE3168E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768823117; cv=none; b=SJ+eqMbcptKCEnPPE9VgYetc/Zia55YNukuMO2kaVk4/6veywZphIGLK0+B2jGQf+7LDP+1ivozTrXi73AU8MfabFdCrWthZ/KqeFTFWk/yBLEYjvbv0CohJ8rHvvHEiR2hSkF64wptNPeG2PzsNzhrssdEbzMVDVxzu9Cg77ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768823117; c=relaxed/simple;
	bh=umryTibXcEQwLZ01ZLSgmOnDPdofWJThj73ttFHadAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+9f2PriJno/M+JH/8ULaTTAa1Rt9T7jtFMANMonU6BfqdJ6JyLR441bq6du6HIeAOYAM8rWCd5QUKMRQ8q2nj6WZXKBqRZ6Rg/ltU82KA4qgCo+wSf+XPHXclNw0DN4xutIhhT25rLBu7SvCQ6+NtWtR54fPg12Nw5wNQfJhdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZasSyb5P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UY5LYxum; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JAR5qc1661031
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/eXR7xA5LS0QTGw/FESYvmdD/IqbbhC/JHHaNFog5ho=; b=ZasSyb5P9baP6bMm
	QZyAsG7eOqPxRNO0n1+7OyzxTuJHEDJGdzalmOBMlWzwhvjyeWqC/q4zqdkB0GwE
	fOp0jw8o4qnMfatdTsLJFOtLMlvvRkGqJ7ctSF5Z+kIgvb1xaJIaTExGnTXM/vjr
	xNY0mwSdwRs0zcWK1tiBoMJAvSPU03sHEWLLXUNhyEzCiGMpQf+oT9W6GH7E9VsW
	yopMYoGEYNiXNgPDZUGKzEPTGmYlUOKTsOMJ5UuTkYKQni5Bggonz7qOK1Q+u1fA
	IXf1ACXWsnAb5dOYwXOYsOFXyX602KMFAhPYnbxMpn2vmjdTDf9ZJ4Mqj+aibiE8
	KK7lKA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvdr79y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:45:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34ab459c051so8970142a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768823114; x=1769427914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/eXR7xA5LS0QTGw/FESYvmdD/IqbbhC/JHHaNFog5ho=;
        b=UY5LYxumRz/QOFscDlt/qY5KCine8fQWIdFWIwbFGiQE34BAUHwNUbavbIUAP13me0
         +tY1L03Onn17xrSZ7kzzVkSr64NSZz/oXdZFkyLMqBxiwSr1xHg6KVXfpVmnuFwSoXsj
         +1wJ/7rtLW9fQa2DsgGsx7RWKyVJIdwXc//4mup97pXFxKDNyQEoVyoGEkNAJlO8xfVi
         gLQpwr4TEGelYHGUm0YrkZla6NFYeeTHRQddKMOHZx7Emk0IKzJtGRIJmFbyBD9ZtuEf
         tBXBRELHNwbdmh3SxNzpPUPsr9D7U5HAiiW2GFgt8xSkYxXd8n7VLVhHiTvoBZfB56nt
         kOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768823114; x=1769427914;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eXR7xA5LS0QTGw/FESYvmdD/IqbbhC/JHHaNFog5ho=;
        b=rhzaYLZBqc4Rrxd/lNzZxzyS5AfSNPqB7jO1NNufbid/d/xVlvcvEvspl1k7TVhc9z
         TKzcuj0uRprd1Hl2sm6sv7SfXO0VmckkYMYQWhy+9yu6KpWmjtuW4akCNeM4rC3u/nT0
         3Lh91x2Ph2FzS3DruV6u0C6d33QCMcYCOyUNFsFp1HNqeId10oxr0dMcj0GG9gPzXHhQ
         L9FSTrKyntaRxUo7tR94ODUasp083I136SlI1F6ow/xAQLqLvegsO20SC/iM7CBvx1nC
         DBM4fBIndHcznX+5YBpNng4R135kZ0AodcmC4KT8nx2sSxyTXUNxRc8qAw/HvgA5/i62
         59Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWIRDp8n919Msy0Mu1bge2i6JaRB5cw/RYJMzIdLIgwit4SG5xoYMIxo2wBbBkgFmNTXD+qyEpqoYMWKzZ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyAGW+lwF6dVtatMO1+jme3iZYQ0KSVvtQPpGrsLcfw0ItD9Q
	5Dyv+InF+MEHNND+k2rkkcgB2Lovuk9i3GgKwsYcboBRX65iswG+7ncw43YXsAB1tIEWFEjzJVg
	4WS+9B+srw9fWHmDWaGv46QxIph1n7idrHlHMW0r9O5QVzAyxdjxFWfn8rDshEC1fHt9S
X-Gm-Gg: AZuq6aLz+E68yza1K6ZNQe7DRZn2Ya+I+u1ZVpbwDU3DLBO6Ba2pZ4Gq+Tq6EquYdDP
	F/Aom4FN/QH2TNpBWfrsMdkeihyKxIYaPRrcWiqfqsR/M9BBxqBBl6UKpMDYbWyyvj5Q8oETEGw
	dly4wxhHuWGR/FdRzJ5/IqhAkCmlGNa+1U9S6CD//Dzrk1JJNipuDh0YBwyBx+Upu3Xh3WAYK3H
	eyD3Ofv2Kf/T+OjPDaQfQm5JsY3lllCO4lGHu3XzwfFdE4Sl1jDz+LnCDebTUcPCD85oeBICJvB
	lox7Q5A03/grEex1LERWWJtquQEWfpJgokRzw+tIUOIlDwFQN/svwr4TKIiAvXqmcrqBr2NM0z5
	cf9dL5krNeCd8S9L7GjdyLQVFhK/BzeJTDoc=
X-Received: by 2002:a17:90b:2750:b0:34a:adf1:6781 with SMTP id 98e67ed59e1d1-35272efa0dbmr9463643a91.9.1768823114534;
        Mon, 19 Jan 2026 03:45:14 -0800 (PST)
X-Received: by 2002:a17:90b:2750:b0:34a:adf1:6781 with SMTP id 98e67ed59e1d1-35272efa0dbmr9463624a91.9.1768823114080;
        Mon, 19 Jan 2026 03:45:14 -0800 (PST)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527306d61bsm5934443a91.7.2026.01.19.03.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 03:45:13 -0800 (PST)
Message-ID: <c8a3969b-696a-4a44-acac-eade9a4d79ab@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 19:45:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btusb: Allow firmware re-download when
 version matches
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
References: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260108074353.1027877-1-shuai.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q4j4hdyl0YP8ze5OeG0j6cKju_riYj-e
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696e194b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XLcW7MSiMK0kOx3OsRAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Q4j4hdyl0YP8ze5OeG0j6cKju_riYj-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NyBTYWx0ZWRfX1gqt5KTw580A
 yKUUEA0lhg3trGDr6qhStto0gt4iI7+kR8CmopDV7moETJ2Xm9nLYjpV+XTMNLdGy3VMGCRYu9S
 2y6S4QEuYrnygfsFHxTMf30/rnFLmDQ9QccMwTM7oXIFUnNcVGtxYs/+SJGAonUt9nBjmQts4fb
 DZdVmhjse/eYIRKraKI7tEAuM9E2DGp8jBCEYjx0mGhSqGUCrmOtk08XzAN1P/2TuAbKdSF7i+9
 ugU1pDeORpqFkdkMEaOVP3CZyGnWf4vGbwFu0qEn/8bg3GUbxBfbCsmsbXxQFLIY6M5FwitHYWk
 wA3U/zvBFipW6VxAxC6kewwikFz7dKwKEVLkkK4PQnMGvL4flT9rtqgYP2XAQv9JDmi1o9Wi4+K
 lLEJvM9nvrMlhrgUmj0VAYhyrbExp/zcPII/WYGiqqPQaSGA9OJett2oqdNr7K/Ni9R2at+hBNX
 gPjcxrkr/yJMdUqkiXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190097

Hi

On 1/8/2026 3:43 PM, Shuai Zhang wrote:
> Since USB can disconnect at any time, if it disconnects during
> the BT firmware download, the BT controller firmware version may still
> be updated even without completing the download.
>
> When USB reconnects, the BT host detects the same version as in the
> firmware file, which prevents the firmware from being downloaded again.
>
> Therefore, remove the equality check to ensure that after
> USB reconnection, the BT host can still download the firmware.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>   drivers/bluetooth/btusb.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 646de80c7..991064a25 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3503,7 +3503,10 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>   		    "firmware rome 0x%x build 0x%x",
>   		    rver_rom, rver_patch, ver_rom, ver_patch);
>   
> -	if (rver_rom != ver_rom || rver_patch <= ver_patch) {
> +	/* Allow rampatch if version is greater than or equal to firmware version.
> +	 * Equal versions are acceptable for re-flashing or recovery scenarios.
> +	 */
> +	if (rver_rom != ver_rom || rver_patch < ver_patch) {
>   		bt_dev_err(hdev, "rampatch file version did not match with firmware");
>   		err = -EINVAL;
>   		goto done;


Kindly let me know if there are any updates.


Kindly, regard

Shuai


