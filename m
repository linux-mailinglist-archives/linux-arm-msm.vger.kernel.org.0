Return-Path: <linux-arm-msm+bounces-107073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QD36FIPzAmrpywEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:31:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5E351DC79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 11:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 890F430160F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFC83A3811;
	Tue, 12 May 2026 09:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BY8GzujJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYEm6525"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10639901A
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778577596; cv=none; b=bXtliQQ7ru6sx/Qv0wBkR57YTTpYidWKS6VxDlLm2jk16BtHJmzlg1wge8JrV+3AZ52/zOSUWccbyFSgMPvbqKGCzAbTStPkyLtQmxpiyi5o9pyAHxMkL6BSGshlsEb0c0+WK10xiM/6Uo5dWiCXwKrlfQCTr8c1d0NMwOcCNa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778577596; c=relaxed/simple;
	bh=pQa+x7m84PBnmw8b+C+pFcE/8l/E8CLRAzXl8GXueIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcwO5OElJ3Ho+DtqS9vpN4N7DyT4DzCPX6WcH6BRGkxhiGAqUSX3QTM4IqjK+Q6zEa1yVMIDpvhrsfQkkqt9TSdsNX58Y7eDi6m1EbvXzHa9G70btIYWTLYcaFbhcRdJTgFBBtKg31mlo3jCXiw3kB2uKBV1Ui/WaB9+WICKXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BY8GzujJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYEm6525; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5CKwS2173351
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHMNfioUWjUvEEM4IfMYI16LOJp6emUsmPwwwed6elY=; b=BY8GzujJ3GMovGR4
	a2g1cmvjsN0xcT+qpKy0zu/SRhzEgm3nI2aGqeE6sI0lGwhfEJV93HeC6uzLOxE/
	xwxPwf9EBcf5s3CuiRvbaYstS10Fw3Cae8ctAxaPOG7kXFZUlmis1dEowjOS0BCl
	VTmzVH7c5MEdcwzq2NDyLROiNgQhGR6M0Kc2ULU9EoUCKa3WPffSPk5s/FGA7/wR
	CybFBHFwty42lBLjfDf5r4n4dj07OWaJyYUCNMLEqTzItSXLYOD+FCc+GK4SlRq6
	AKhcJrb2RZ9iQzL0jloNvoEInH6YaU2mQD3mgP1OMRN2JcblQ9hhiXix3GPxCCGD
	AJp4LA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvjag0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 09:19:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514ae0e3ad6so65025551cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778577594; x=1779182394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHMNfioUWjUvEEM4IfMYI16LOJp6emUsmPwwwed6elY=;
        b=DYEm6525d2evb8+ltLyVAA8LiiwsNLCHvx7hLoROM7l8UG97ysnYtgBkbRwCqeU7EA
         WWnY+oFE+uKnpr5robJdzkvcDaMj5A3w/17XN44Q4msoUW3/rS+WqZrX6m3c+RCGBIGU
         Q/MRTuwqDnZvi3JPQ58eG8hl7Ho93sMKpNFQ1seT425jI4tR6fdsx+acJE8ghgKFjPM/
         vze5fd6OINED/DqwHgu33TPQqF7FddrkqKuTFDjEERM6tPvBhRL7bQ2XfcQjc8w0dpbQ
         PKgVw5J8pCy/Q2zqrkls54GDdENw9t/HADQbHm91C1D0LduBUs47I3JRtysVwwrXAa9R
         bXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577594; x=1779182394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHMNfioUWjUvEEM4IfMYI16LOJp6emUsmPwwwed6elY=;
        b=HKC+jwneAr+oGN0/dkcponMr3ORYP+lMaZeYLu4uGmYKZDq4yLJVygK3POOrpBpmdg
         LviEs8vjiLLaxNRU6hDMwtqeGb3Tc9NCS/DbTFN2qQuvzooCTkbhvP3yTPlp1NLTRbyZ
         pTWjm0fY3bDs4kv/LmKUlBJau5bKbNdPDu4ACWuKBRBM/gVP5eqbGr9A1Y2QsFQ0zbD8
         pOKhsC3plK7dcKfXlxBId93jt2sb2xvl830tHls+Jrfb31zPm66ANLxDpafmATVDS7T8
         A4PB+Dp+lOKasNfWuRcD/G0wbQPcvfJB+JcRTxEIqcY3Ryg6K1bE0/ddQOUAwDBbrvaF
         xvBA==
X-Forwarded-Encrypted: i=1; AFNElJ+YUaQ1HZnIO/kVMRnkCXXpJ7bSafKHI3hi/VKbfLlchOpu+YlLmyLqGXaa4U778aZGN3/ws/PwWgin2bJh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2GClzV2sOITaqQrUOMD+CELjND4h/oI0fivD7tseT5QQ8Mcg
	SpajtDwoR9hzmTqpXQN9QFb5LlK+w5liIKOQUKywkyj2MstS7DtxNDLovtcIwo3UJ4qqH4D6kHb
	QbJtjajEzBe6KHrO9+z4Hoi8a4OlpVNYApWqVhMLlV4kkeOR8wnrFF4n9kY9YkkWmmlGt
X-Gm-Gg: Acq92OFMIgfnnAAWs22wQf3hT55coOmOwjT9qDVRIG0b1QxmKjLNextWyWx1AAhwHDk
	DOUhVJ+ff3m+vpJPNa8NtXs8C+8dBHedJ5ZLpRLvMJ8SLD+uYQ+2vyCb1LLBvSasBU9bbewiLjX
	WhEKSE17hYg5XAuvAnXnhZQQLxwdeoqV1PYwMKshiHSoNkhzhKxGx+Op4Tj2iYOVdP4bKrD3i/2
	EN6s0Fm7d3QghfR+gkLeAuzxMs8P0ViPcY2NHCD6m/3UqJcmMGzxzrg0uZ+M8p/mkeectjrsULV
	hpuZgd5sMvT8nkAhhz8D1FZbfEOC9rSJ1mgZ7bWGMDbxz44fXTcEXCpZgeqTn3QdKdB8TtM1x1+
	QcziQJI9cWS9kTn1XAOS0tAhfteG5JZiWudi3Wpw1i+DnPjxFOj/KLk8dETCxBIhEvuPJhVdINd
	MTojIy7ACP
X-Received: by 2002:ac8:5804:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-514cef5f533mr37460141cf.14.1778577593854;
        Tue, 12 May 2026 02:19:53 -0700 (PDT)
X-Received: by 2002:ac8:5804:0:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-514cef5f533mr37459911cf.14.1778577593432;
        Tue, 12 May 2026 02:19:53 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm30575148f8f.9.2026.05.12.02.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 02:19:52 -0700 (PDT)
Message-ID: <06073a6c-1f75-4dad-9309-9bc47a2b4708@oss.qualcomm.com>
Date: Tue, 12 May 2026 11:19:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: qcom: tsens: atomic temperature read with
 hardware-guided retries
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
References: <20260511071024.3130247-1-priyansh.jain@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260511071024.3130247-1-priyansh.jain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1oXDa3CpgeBQIPDliHHxoIHtbK0Ka9ki
X-Proofpoint-GUID: 1oXDa3CpgeBQIPDliHHxoIHtbK0Ka9ki
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02f0ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=-FAaCMRnIu1Sos4PegMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA5NCBTYWx0ZWRfX1db+XpUmbCJy
 W2YTN4T1SvSfS0eU8a6Ty8S87dWKWCAw0IncRiKdKUXyB1erMXOF8N/wiV9bemF0vz8TEUmPtql
 6BnTCESFNHsH+SbgjjPTC8YPlm7D3Q7H1NpOWv2xFwc0ZpRzyUrHn6n4IwYCoJaYzbKgsHH854Y
 4ZQCYHZefzpeOtFx+w8Q8rXXuTBnKsLn0sgiN+UMGvrqwh+nq0lVariHgp7NRWPdjvHhUiNkZld
 Y+9UnV8eRcWCxRyFve+BO7j7UzJjgJONyCyaLJdw37xuva8AdGAh4sriRCrqmU0uB78cUyhpx9b
 ChRHTe0kvZ3HsUgqI1PcPrHxvw3QA4gk6o4bt5028IKehs6f6i1WMaE21gGcWxGXqBEJB9GmnlE
 rDcYrEpRv6oKAsdILCvQBCRWnXzHlzDhKvsRqiX4HUjIhiePBti83SEf3JftxSaOg3sQMSRL1xN
 tpdej62/5U1yXd9QKsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120094
X-Rspamd-Queue-Id: BF5E351DC79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-107073-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


Hi Priyansh,

On 5/11/26 09:10, Priyansh Jain wrote:
> The existing TSENS temperature read logic polls the valid bit and then
> reads the temperature register. When temperature reads are triggered
> at very short intervals, this can race with hardware updates and allow
> the temperature field to be read while it is still being updated.
> 
> In this case, the valid bit may already be asserted even though the
> temperature value is transitioning, resulting in an incorrect reading.
> 
> Hardware programming guidelines require the temperature value and the
> valid bit to be sampled atomically in the same read transaction. A
> reading is considered valid only if the valid bit is observed set in
> that same sample.
> 
> The guidelines further specify that software should attempt the
> temperature read up to three times to account for transient update
> windows. If none of the attempts observe a valid sample, a stable
> fallback value must be returned: if the first and second samples match,
> the second value is returned; otherwise, if the second and third
> samples match, the third value is returned.
> 
> Update the TSENS sensor read logic to implement atomic sampling along
> with the recommended retry-and-compare fallback behavior. This removes
> the race window and ensures deterministic temperature values in
> accordance with hardware requirements.

In future, please add the '---' annotation in order to have the 
changelog below not included when git-apply'ing the patch

> Changes in v2:
> 
> - Reverted merging of the valid-bit and LAST_TEMP register field logic
>    to preserve the regmap differences between TSENS versions
> - Defined valid-bit support and last temperature resolution for all
>    TSENS v1 and v2 feature structures
> - Defined last temperature resolution for Tsens v0 feature structure
> - Dropped tsens version checks in favor of valid-bit capability
> - Computed masks from resolution to keep a single source of truth
> - Minor code cleanups based on review feedback
> 
> Changes in v3:
> - Remove valid_bit, last_temp_mask, and last_temp_resolution fields from
>    struct tsens_features in tsens.h
> - Compute last_temp_mask, resolution, and valid_bit on-the-fly using
>    regmap field definitions
> - Remove field initializations from all platform data files
>    (tsens-v0_1.c, tsens-v1.c, tsens-v2.c)
> - Remove the initialization line in init_common() that was computing
>    last_temp_mask
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

Applied, thanks


