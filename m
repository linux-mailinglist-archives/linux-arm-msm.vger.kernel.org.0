Return-Path: <linux-arm-msm+bounces-104869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKjzKE9M8Gm2RQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:57:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE1347DCD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 07:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1E3E302BA48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 05:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4875F324B31;
	Tue, 28 Apr 2026 05:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJF1NJGO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdxHiT8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604630C62E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777355828; cv=none; b=nsr6WZBUIxn/QL8Wbqa3fPcs51OkBPf3EVMKcmi7Dh1Vnh/rZ3EVpt2gztylNLds96pbo5JeYdAeeGL+ElJ7Vo8fYLEy3XYWyL1X8I/1qDxv0csqxBkt3DvM6sBe7mUxhMZO+4kYwMp8RVw/dp+G33dbavLGrcClBJ57nw6SDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777355828; c=relaxed/simple;
	bh=LcsFCgCP4R6KBEGDNcumdoG43Kb4ysX4yrxLJAHaZio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9cdHAtFU3YRquamaNG/cd1FOmOGU2MlVKi/i8togoV+1JxyNB8rn8D/fVaE6YSSkcVxD5jw2caNXXOpQ26U1osEAulmSNikxX6dl76/OOht/2WCQbP5TYFOoLbCNA/C/PZJT+fCzAC0bDk5EpBvLqYyyQpYnBvrS5AByJGu8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJF1NJGO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdxHiT8I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RLpSje241606
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=; b=JJF1NJGOIZBXJ1x7
	wMrICmNnwrmaDKkH0DxKiYTvU3ZPMWfLg2j/6qzFj9PHO6tX68lIsh3iBJM9EpeK
	XMMMrj4PfRMWWjWmdOlrkGB18xpfDIGYs6BlUfkBYOKtL6txOI0t0PF8TFO/Jjpv
	9tSO8LGZk9ZZwRyOme2dsdHJPgHlCA9f14PKICtwVcRhrQx1bBzOrN1rChq868HC
	peWkzm9oPhKuiyHXcyhcEsTRrnXf8UDAa9tMLCmIUovIcYH0uXuc+BeERKHlK6fo
	5E/WDMCbsAjTR7w0Nr2HGLdKgGTt2whSd4Hg+zMHz2oaU1FztxcGk1my6sIgiWrc
	f5tx3g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946u72n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:57:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adef9d486bso100927135ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777355825; x=1777960625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=;
        b=XdxHiT8InWj38CItMBP6diaHKKIOAM9FTNz6DpUsPS9m3zCgPZsLm6bnCMRLN3kzQr
         +4SBpREM49jZQviLao0sWFLwrsTOuvoqJ4xUp+bQbPyE3RQAs+idFnu4jQ78lqL5WSfj
         lSDz9uTfC6lVNb7TPAERm5FiZVYQRiFI+yDD/lo0w+25qBb9/LlvdTcIvollwTysz/LS
         Ow3S4E8azIxnekaa0s/AlR9CSJGenUwonc2yH+b0fkGN9P9e6r/FUHvCOo3vBcbeuvJi
         AG4QFtmSB8pnM5Vq9Wbm2ULfUWj17Ch5apCbG0Buv6a8hHvJAM0PyQ0S/wZ2w1uwFFzn
         /H0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777355825; x=1777960625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cMT9onZy7Wk6dCOLu4+Qo0WwTxabZn/BHLlu2ijHpt0=;
        b=XeLuGVUSnRiAuiP1w1TmU3rW+TeOqiZ8qc+KJhjauviG07rZVmxWO6SIhzAHU6vaVd
         8H8JbUJFsaWHJuYe3KZq/g3ULB9iPiH0ILx9/mP1pGAnqT/0sbVM6SpfZf/7vJ5YHgmR
         hMOxwIhN73tvQL4nl73HmvFbGvUbYazRz/N9evlavyrV7jd0nQzCCqEzgfIOFCSSfXX1
         c9alye3IQtVhlgOXH0xCpPlJ9UWALS8KxN/PuOddDQImcAalgPS+K6AwAXubUvz1q3mm
         QoOqIIMt+VixILIAJQdGGRZz01MEIV11gnBzfXqO/xOHfthK8LKduJXFY597e5LZrNgD
         U8Og==
X-Forwarded-Encrypted: i=1; AFNElJ8s5FipFYoIMBtvVk5kGSOh9odbfGyoBGm2yfe/BwsaUVTm1dd4Apf+mUM/S/ZrUcoi9noSUCD6lvnq2RqY@vger.kernel.org
X-Gm-Message-State: AOJu0YyQIlvIMo1pFwE71z83rWbWn3+F1IEElgG3GaZuIDfA7+0H174i
	2KJlwNnSBntSetM9TSZn4vhT5+7QgGDCrc7cjuKcJlbw5PmBiLB7PB5Mzj+PwQGp99mDuY1ySJv
	yyMDEDe73YmSD8Pcpa1+QPZkB2WWGJqom4hzxmBHF1i8nLYHeRLRZ5wFZUD2QlHSENjbZ
X-Gm-Gg: AeBDiet3SXA8e0IATTSbbrDQ0HPEwrU5iIll+4BVfHyzEaStmQV2JJUowzryml9P6hi
	w1o/DrSxixQiiJGgoGy5UM8jOzv9XbLb+7xoz7/Ld/qx/Il2L5K2XYQJEaCTYy2yTuMoYF0ZqUW
	cKvDBJ0PLmGvLG5T3MYiiGeSAnfPq93McSRACJ0tGl8UZoiu9yve7JSL6XzjxCnlWh/0hvlO7uN
	Z+uyzgluiXmmYjxV8izPshTA2+2dSERn2btxEM/ob5UNw3KOm2yPmabDs6CuHjY66TfKL+dChR9
	04xlknXO5U6u6b0rGQ8FVySdnU+8dKuTHL/THU47zqPA8YCu4+DzG8kWXYFtSCDcciZ7bWslmrG
	w3pYkT1HRgnYzL4a6UnQ24/jMGXO7ZIAG9JDMWRB17MwQTpNPRt8UiQ3BGP3W0Pk=
X-Received: by 2002:a05:6a00:4f8b:b0:82f:8332:492d with SMTP id d2e1a72fcca58-834dda8c564mr1904127b3a.2.1777355825001;
        Mon, 27 Apr 2026 22:57:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f8b:b0:82f:8332:492d with SMTP id d2e1a72fcca58-834dda8c564mr1904096b3a.2.1777355824524;
        Mon, 27 Apr 2026 22:57:04 -0700 (PDT)
Received: from [10.218.21.127] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf3121esm1295298b3a.38.2026.04.27.22.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 22:57:04 -0700 (PDT)
Message-ID: <ccfa913f-4fa5-476f-9a17-32ad2392e532@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:26:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: dma: qcom: bam-dma: Add support for
 kaanapali BAM v2.0.0
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260424-knp_qce-v1-0-813e18f8f355@oss.qualcomm.com>
 <20260424-knp_qce-v1-1-813e18f8f355@oss.qualcomm.com>
 <20260425-handsome-papaya-porcupine-d42df7@quoll>
 <e00eb12b-e8ad-4db3-b4f3-c8a81f6a081b@oss.qualcomm.com>
 <2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <2d79d1b6-be1f-45ad-b673-c8b3b57f1e15@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69f04c32 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=XH5bq4SrENkH0BnSGEgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 5B-jNZ52JhdHuaHDaH3P2DGKXZXjJsaY
X-Proofpoint-ORIG-GUID: 5B-jNZ52JhdHuaHDaH3P2DGKXZXjJsaY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1MiBTYWx0ZWRfXxOReXmtIySeh
 S2wFnIkXH+1D/zBgRsN9DN5bDNZKmNJzk7FzES3lrsNdKMafLXaMwDYhst7w3S3EASUtPvCbMf5
 JzdCRyW0jV8a6foSfD554XCyk8qhMPX5zSCCyPHfKCdr9q7Jg//oUK5XN6XO/bG4Qi13eZhZDiA
 qKLBRmT+kbfwsnTXlt+v8sbbTFRhisLah1DIGy1LKPRQDKa7YEmtFV0L+qewH59ANr5QTUAWqi6
 RhIs/8lSblIFGcuAkfZUmHVX0EdYAMdobyQOZqaRduuErz2rtTrp+6A1LnZs5ISl6hPlsoZBEGP
 HgAaxbyr4QzSbDdkAm+S7/Q5cbYAB9OLvtWkrT38VG65jfwP7zIVH/A+OLBZsv9By0PvtVh3/Mr
 daGTUWqq9zca6qPdFaIHt9RwgdYy3agh2cKO+o1cprh6RV6vKCzn463pCEG1ctssEOzkb5fzIGe
 kLUFvx6qdRxqKitjQIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280052
X-Rspamd-Queue-Id: 4AE1347DCD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-104869-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

>>> Drop the example, no need for difference in compatible.
>> The current example captures an old instance and doesn't give complete 
>> picture.
>> Example, doesn't specify iommus, qcom,controlled-remotely etc. whereas 
>> recent ones don't specify clocks and reg address/size cells are 2 not 1.
> 
> That's fine then and should be mentioned in the commit msg.
Sure, thanks for both feedbacks.
Will improve commit message and repost again.

-- 
Regards
Kuldeep


