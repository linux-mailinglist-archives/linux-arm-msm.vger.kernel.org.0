Return-Path: <linux-arm-msm+bounces-99156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHIzNSoIwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:30:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A342EF172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6347C30259B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE30386C03;
	Mon, 23 Mar 2026 09:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Da0EFngq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ES40Ybgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1FD386436
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257916; cv=none; b=mp2ewQtcdn3O729vcODtQH66C6aH1qB1Ala0e6ALdNtRggqekg7vyjI0sdwk0Kdt82cnrAxf/FeOQKXw6YZDjzkYLNtMPm7pkAO0ySpa5eTa5Yc5Y8ob2XXKUAlAPBHs4gve/6UDcw+yXn7fmOv2wKWylO3vIaON1g4jhK/i5ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257916; c=relaxed/simple;
	bh=fkzyrRfvOep205PPN2JQYaKm2TXbSFQm30ctj7v+FRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbIkEtU2Dz9GrGrJEDhoViZbQJwDlG6qbdhtnYFPatrDeOJ8pG8JDvcKv0G/4/zqHr/tUIW/rXrqvwjsUDTDJpCG2IxbFcul/BMs/5B9bxDsMiZPS0XjO37nJp6DK2lzV9dhjXuze44uACQdTKZ+rZkgkdv9Jdxc7VwIWzTrTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Da0EFngq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ES40Ybgy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4LwIN745170
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=; b=Da0EFngqA2GZY9yQ
	/x7CeRvEu4ZMpyU/ET3laPVPH60/2OsR/fJk/eZuwG98/Ckx9eMCqRdevf+3AMDu
	0aiyy4G/NzFqFCQhJn5f0d5s4C/VSJQd5XEh3KnBFS/khTeJTrA+BLv9Pq8zkhLY
	ivszt0+O35STGcK6Jkrn1/VZhJ2rzzJGA9RWR5XgWXCmkhs2WRn3pcFx0Qum+K/L
	XD1eY0YY4in404pswtn55WkScBlh3eUfHIX2wSjAh3P/s7zC1qX1ZzYrTs9MxcPD
	+x0JqVUgBNxgzOW3Jnyk5ODg5lMdbCYUoO43I9Hy2rqH8MQ9Bs4WjM/JE+Jslivp
	zLB9/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5msjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:25:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a04e9d4faso32987116d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257913; x=1774862713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=;
        b=ES40YbgyW3fGt9U8w6wSge3Qd9YtoZ0ksZTKhrEP64TrFKrviaidshwHI4unCVJ6Zq
         mfEU8CODwe6Uq07Ibw8lGXWBtyONsQQ7fKmTTeWE/GzuprgMFqyzIMT2mCY/UbD/Ag/z
         J1tuymDAACmPzAvJnP+6EGi2GtcS0FTZs4vg/kTZL7vTzqxZbwOnNujQP3Y5ULyI3ZIH
         1q0WXDlzBTMwC8XwUjidvFmOVZJPQPRzEVJ8Q8SIYJOio+OCUV/t1xcAnMLk6/zWc7O+
         Zesi7JJar9WnV5SgaKXl8KgXCGimPglp+ZRvpgPnBBDCN9yZKEvYx+wNqrEEdIW0N5i2
         p78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257913; x=1774862713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sE9eYP9f7TvVimCcBKQPh/y7RUU8Zp3HBeEedcuDQrI=;
        b=YfuHBUqiemxZ0sKTyCrjgkeq8LpOcbwjD4sNvKtcNcxqOXGz6/2SX7GKtwHMazyL8d
         vjB7/l/WHdY8P991+c5NrODCe+yOSUgf3ga6aKWJr3PNMrKfNX0XdiBZnlsQ2nYazXjF
         qg635PdGvdF+qX9CJjCrVMC28nPSTd1kZJOBcTHTv2YDlbx9jfCMBwzX1ca3oUtURgEp
         EgUJEl/j9dPAUaA6iZU9ehw9KPLH3u7382uWqTd5dLGdAbamirfzQHRBlqwIgqjLSJIW
         c8+tQPa2PsBYjhIR750EJAMcUuq30FO/6jBb29QnWUERtndAFyyqMA8mdef8h5m+3Fl1
         jDUA==
X-Forwarded-Encrypted: i=1; AJvYcCVN0Knl0+f5RyIr+pRG9rTy5A4IucawV8FJ6MRUc8Ay7AIHVA/N1eKSe1bpHJ3H49/QwdtASMlnQD0aXzq8@vger.kernel.org
X-Gm-Message-State: AOJu0Yymfrz0VhhcmXkEiCsrdGVMFw+EI+HomBTcwXmSZbCons7XVWrq
	x9kUEs8IzNRXI/9qYmfy4D/qokTOzX/n6lDtamtGMraKLnCKwwtljVzb+h0eHSyuodJMYw0cQaU
	kB/N9XMRvUoUJI1pTz5AJ38nKLIeBE8p/WuhmA3JqUq9k4jkN0jwLDfMkyfTS/D2oJPS0
X-Gm-Gg: ATEYQzw8cL/c8PQ9e0K0ySIF1I1Rr1XLIUMDOL9sDIXBj2mvEhNgqI/OU1RBckN4B7q
	efIez6qKwwjs0AhdrPIKW44lmmzy01NPuc8ptbY6zra/YFicmoAwoCtDxGY4xREBEJqaaNTDkr5
	IAyuzeM7ZQxmPEid8f2t1PwUP+R4NxAJiQuzqiiIFf9c7QQ6fk7WWjHvMMPmrtIgh+b8DJhATqX
	Cd7makShadASPY6i/wO3fLwQGyw+Qm58KEdM5G/tmA1TmuVs9vWE6epcqgKJAzpQ5r5uIrSJAYg
	49J9YbyE/ARzy5st+jIlkImeUewKPa8a61dxfQiqnmVvVQAx7QoA+0z7gSxpZlLX7UNJacqQI6O
	yf7kgdJCrtQNFoJ9FPjl0c45fMuH0lfDdOc7VmpZH8OXDbt77K2OJu6XHvHqYYiU1wU7hlgKxSJ
	y9oA0=
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr144004536d6.1.1774257912996;
        Mon, 23 Mar 2026 02:25:12 -0700 (PDT)
X-Received: by 2002:a05:6214:62d:b0:89a:4fd5:6998 with SMTP id 6a1803df08f44-89c859d79f3mr144004356d6.1.1774257912595;
        Mon, 23 Mar 2026 02:25:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm460842566b.60.2026.03.23.02.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:25:11 -0700 (PDT)
Message-ID: <405c4ad1-a31a-4f51-a093-bc99b0218cd2@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:25:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69c106f9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Pr54VSv1RYEdn74eQc0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rRjePyzetdmb20FLAT8QTDIXNn3FzVHH
X-Proofpoint-ORIG-GUID: rRjePyzetdmb20FLAT8QTDIXNn3FzVHH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfX2Ql7WBu6NGv+
 YMRu8+DCPG/TjDiS/3QOAY5jw43IK+7+JcLuK1pj/wYyB9jT+fay7k91+cYAi06CwK2DlyHv2EE
 V8rvq2hfD4VPqBMa4GkFn/AV0dC+ssemJd0zDtDjAoGxLUIx8GfTAZuyf3waoYQd5+/WuECdZHb
 OHrzEY0Pb82QkTy6MFenxO7gX3PZLrHydZfmJZQO49uhH2W2OtuPnAdSlQi+dE9PpA0skGgQoMW
 L23F3V+W//n0RtIgEtxDavxXGLJVk909JrJeLh4RkcmJlk5AnDsHzr2MUw2oNHt+CHl4gk74fjo
 pFloJ7R7zu1pMZBgzs7FYRKM14kJupFE72lv7ddamaFaOwhpjva1cK71mAK9VBRGbaaLDQ3RJZH
 WEAppDxso0qFApkoz0AZTfwqMERNMmNJ8OKlyFj+1dvqPfM5uLs3syTE6OscEflyu/fjqg+ZOR6
 bFsYtDHGop3RGYiHyFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99156-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09A342EF172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 12:08 PM, Jagadeesh Kona wrote:
> Keep GCC USB QTB clock always ON which is required for SMMU
> invalidation on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

