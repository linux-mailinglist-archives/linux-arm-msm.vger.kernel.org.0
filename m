Return-Path: <linux-arm-msm+bounces-92658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xrLjBEOgjWky5gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:41:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9A12BF73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F3B63074F2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597962DFA2D;
	Thu, 12 Feb 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0c+bpNb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+y0ikSr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE52DEA67
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889261; cv=none; b=q7s7yrMfFcT8OjloB9I5pozis+TaEZfblN6VAjk2/LROyRXAwjAvq5yj2eeLuUxDaRRz0CiG0gqVDlfx+z/mOg7B99glgcYl60iEnJqj/iBuqTzmUuJoMx1xLrSo5L3JfD+vtmoiZNXiQ7cCGxpxuSKUFn4KPdsl5pKE43HGbGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889261; c=relaxed/simple;
	bh=vP2BK38i3oJFHkPvKr+478wjY/liPIsQH+4mmLDOTgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogHe7Q1jmUoCQejtSZocRWHzA2zj+JInlzr5bTAYVdazm+705uZl6wwqBleM4U8FNIpj89NOiHpTny4fYkZYhfPc4AHZ5Mc1cMqf5rrJyJAEOWgtmrYmWKTqn8iLChN/4qlRmkMSaER7IAvCftQgNxAu4dx1hMdbSUWJvqafPew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0c+bpNb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+y0ikSr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3ReDW3143649
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVUnKtWGDidpD5rwruzSFxm3EbYleXj3czyGmpxvsE0=; b=o0c+bpNbPGua7VHP
	6Hy1Uvv1hVcX2GH4eHMuwKRD2rW6Yf7eG8U0W1OLE/KO/YjBOP6mWaTMzi8b+GD6
	MJakIdTUA3H1WGo8l/yy3er52qoLsWWE7tY9Np55Mfx6MXfqCORTCSxe2WVCwt1a
	Im5oWR8ZyscMqwByHvGrxm1p7wfTY4c4h8CzCJi18vaxA/D5TjrMTQYH+MSs3LEg
	+cihK9AP820iCNYa491/sEmBDj4RduKDYppwY93m1gJJFDdXo/v+G/Jc74y/kgU1
	O9KdHJa9XIW4Ex0dwfd8kf8mRNst47rHcyUyHQBJ5ROVF5Xl7F3yjMBddL7jVym6
	SrvbVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snhkqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:40:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3978cdb2so5656785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770889258; x=1771494058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IVUnKtWGDidpD5rwruzSFxm3EbYleXj3czyGmpxvsE0=;
        b=B+y0ikSrkHZboGx5qO22H4Lzqgdinu+9h8pwfgzKObIwEuTau/W2R202/pek3Sc/uE
         PDYvtSK0ouTVXVF4q53a7Mr4J2G74nh2RhK+AgtRgalKUz+bI8XP3L3tn9so4ZciaeSO
         f2O5gBEnD07kvNvVKgBSGZkonbTQ8rC0e9j1suVMQGqBv68ZLjnKfI6P7088qVKGEH4W
         g4NtanvZixJjI8rKSZQm3Wqs0hZwQ78e+fPgTCRpy1a/VHnF8s9ep+XtS/+FC6vcEsO6
         Ms9NF6U3iegNIqMESH1qs4LIx2QvlE/JgPUKvCt/HOQjg+0WHpfyHjr0/01CqUpD4yOa
         JlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770889258; x=1771494058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVUnKtWGDidpD5rwruzSFxm3EbYleXj3czyGmpxvsE0=;
        b=Lvj2qfGB+3KhvsUTmTSdHCqpVGqNpCytMlfYDqmA0R++Vw75Ito9Jk89HDuZAIOaNn
         I93pnS/Zu0gT/lzsdYaTiNSaKMHqkTli3CEIQXgZdL1hEGbmWo/cDNGYoLiWYkAQMGhT
         Wg2oPBIOHO6eRGTyaH9bK0XrzeaSNaQlNfypDD/7rxFWwwVKiw6G/RXUjOJrQs4OMGkz
         mt6TDQHNEkqQFyeguwY3k0marF/NBvTQqLPAXaASc1FsbdhqTeLudRb6mG/6ksaLoFAO
         PiWRsKHbweQ1MY2OAkovJQA/u7NB9jgJa0ikm4fZ+Qnoty8nAbBoZkM7otUmBLWEXI8+
         69tA==
X-Gm-Message-State: AOJu0YyTtQXf+UGcbADCSeXlN53FDn6pRleaoUoc/W6wcbcseUZvEIY2
	1L9u1ypG4J90g2hECsTewh8uL6zwccr4Ok9mC1dF3frjd2mA7BJ8GKNZ/IK0udA5DDFkX83c3yv
	ded5gfOCliD7s8uRH+YeGsp4MJjsVNV48TJ8sOA/BkJ+hdFNA/X/93okUrUneABkp7hYh
X-Gm-Gg: AZuq6aJ7FGZjPw0Sa5sfopcC6h//EdpNN343N+74TFb3DsWtvecMeuQaxqA6zVh8gew
	eBSbAFPzTSIfQcmWT2swR/o8udhY5w0S1bA/7poIt++ipEL41x8Q67e3nnz3rVgwfIf+/rcfCOf
	aphYlJOfl/MhgF5imOUwScnyt4Fkyds/McTF+oskn9XuLm6TvhHrGMdkBYGlmAJseanoycA8K/B
	jcUmWa3bB96IuyuFOzO3pTFUYnkcHFLvV5Aaiuhwb5Uzhdk40BesJQ7bWidXNPXYKcosUOjmwgu
	c5ssoTRjpgPYxLt6lcK062ZDy10YIDMxxXRoYiX7fNfg+pmMcYDKCjcz/bRpqhAgq4JV3KY/3NL
	jINesGdyQGGyTsWtQwAlo4wLBigZmKIRwuFIlqaO29zDinLT+RkvqlhCn4IdOiv86YnkNIBkW0K
	CTh6M=
X-Received: by 2002:a05:620a:2988:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb33117da8mr204829185a.7.1770889258519;
        Thu, 12 Feb 2026 01:40:58 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:8c7:17af:7ae with SMTP id af79cd13be357-8cb33117da8mr204827585a.7.1770889258130;
        Thu, 12 Feb 2026 01:40:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6e9a6a24sm143792066b.20.2026.02.12.01.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:40:57 -0800 (PST)
Message-ID: <84c15561-965e-4915-a4e2-71eeed79fbcd@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:40:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
To: Xueyao An <xueyao.an@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260212082558.2811953-1-xueyao.an@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212082558.2811953-1-xueyao.an@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MCBTYWx0ZWRfXxMZZPKbpzsnI
 bRf32b92iBYV0TSuOv3aZ004D1A/YjHwg01PHhDFVpa31+/jSBpgRWbbUe9GnuitfpV+wyYazhb
 KIWVDC/gUDzvVKP2OOaLX9tzjhPZ8ePjxm3jWb1TAUnkPVDJBhJ5hWTwRvX9FLjHaMvc4lM+x5H
 943cSXfjFxtc12tLNLzldd4OdLDs+MG8z+Ld9FOunxq0oDfEmnfIEvErFhiVe9htdiWT+u84vqd
 QR7Iobn1yzsQz1KgJazTIkhH+Iru6E+aMyZWB5bAUqs9xQd2vehR88UsbVAG7uitlqSi5X8aNRS
 4hvW5JxumuFaOtbuzVbdKNCBs0uFp5k8UFpTZLu78HYOv33EAVsXKHzV4gbqmQ1FXrWCvfvmsM+
 mnYtbua5weoHTRZFI890nB/2LqYGzlpgVePUR2hJLvOGW3Rb87891FSZIUg45y6Wr60OUCk1C1k
 GfksFAhmy7+dNTjKRnw==
X-Proofpoint-ORIG-GUID: Rh6Nhwoq2bOn8ALl53R8g0BWH1_-zPcF
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698da02b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Rh6Nhwoq2bOn8ALl53R8g0BWH1_-zPcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120070
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92658-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85A9A12BF73
X-Rspamd-Action: no action

On 2/12/26 9:25 AM, Xueyao An wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

