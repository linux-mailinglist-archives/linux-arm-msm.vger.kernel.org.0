Return-Path: <linux-arm-msm+bounces-109657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIhbD+NGFGrQLwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:56:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D85CACBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 746463008D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2C53839A8;
	Mon, 25 May 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+ZlAkV9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGtU4FIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9D2D94B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713735; cv=none; b=ZXIgmIJIrVQZ2L9NNSGl1CmDDwC6lMh6myWKoaKP1S+g6yNRtDqiDJdEOdCLV5BXXR5r0AWZ1EUEzqwqEJ9oN1a/WupShQ+oMGz2oV0rvR+ayG9rabWYYRmC45JXa+blbsNf5i8RkK1zBTDjT/1eYEqhmb3xTqmTO2lJGtxMjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713735; c=relaxed/simple;
	bh=QQvYXgQZ79JLNJp7VZ55ftJDAMYX1KQCsL1m6ngHEyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qh9zRRI5a6snre4eXJt/gIgLrMIjRadXLPM9Ew0pUFyu4u56d9l2DLV8EbDayRYnwkiX9BtR0ts7qG/S4rq4LtVlv3jkLkYyFcWxzd5/MH1Q7yreluLIhk/SN9bN91wh79K551GUeTzBpx3iGKf6ju/CqsmjZzScIebD7JgI2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+ZlAkV9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGtU4FIC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PA4ZXu2145961
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=; b=k+ZlAkV93y7QjTmq
	31m8q9bC/i9XmeB238hc/RckBBjaaH74Dsu1vE0hOd/7x4PinREo3lW7wlr8vKhJ
	5kwTe6Kbw+N4XahID2kuO4NmzehJmzVnOOdng6biu89t/xLqxJBajN1DtFjG79jS
	hVhIw4tFa0h6QKTJFfzM8L51RATLX8xQlRNgK2BYOHRp2NchJaYHFmqMnMiE3u29
	ad1MdSkw0eWd/HXbll2s0xFekZWbTT1D1nmWybBCd0Q4peYNtDMm0o/Umzd3lzKF
	t3dmWRBT+cGaCajwCd3xT7+mN2mRpSsI93MVcOgxBtXgtss38sl1zjANDfbmQWbe
	4xZLTA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv0gu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:55:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so31800891cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713732; x=1780318532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=;
        b=QGtU4FIC+YujCVF0Kj8thTeO0HyJOqWYJKD5IZn8aRVLrGTZEqu9cSt4QPQu9mzxxa
         UYgHa1RTsOzd4AFXEIP2TgEgR0OEoz2hmZ2/l+suLYKjj5VYG/XNVCB8rSrvsgnKG6ii
         qEOUK0mfxwVO9leyzh8DAhxtzLZSwm+6O+WcuYmeDYOoQNi7cA1NAmFFHFWt6+ymu9BL
         ontm/rrzwjJ/DvGoZduZ4bmA2Z8Vfx3d8c/UzmsMvNzjS4173ybuAbdB/ssmymw+T8JE
         vFf8a44PhIeojdvRPcw9dPxcUqtNkEkPHOQvgTmRN1IcH+998WKW+4aM694sPdi8Wc8W
         aEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713732; x=1780318532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNpASxgRfAk7e1AwXGXiG0LyhF1sC7Z8HgJNbKxjysw=;
        b=bR807V5AG0EJ0hj0G+gOzJnE56CK9QYo6eMqd+CPzo2yeJhJ+wvJ/MEIz+R3kxEjlP
         oAPCDPJqB+vXTIzaafC8HujQYHNlTxApd5utpEmZuiuebOk1eP0NfXxC/bbTSlGiqjTR
         orQ6lt26LcHPw9RDeYHquFk/0dVrOMSiSN2BFs0nBalp+A0XpqwAg1/Nam/GIt//jY+9
         ouA45y+i6eN1nCywJmRMO9vgdw4MlTsqrmTEpsVGD6M4be2pd99nQoPwvSf+Cp+YdLQV
         B0SuntMI1Rm+GTQp4pOZXjESxy5TYlV/n/OkccpZ0TQKIem1ep7sQZNgf+RR9rhRZBSC
         BiGQ==
X-Gm-Message-State: AOJu0YysXIfJc/FqSNw1cLkB67F3u+sHjFI9JRTjwq6SHHD/4r7OdCf6
	vZ2J9MZV+TLrMitQvZBFaN/WJ+X440o36SFtVacI8mMXsstiqYoSnN2se4IxglANgLgvtpYiaG1
	HryI2uUNhgW+wTNukOVnx1KdoUwDCC4hAxtV59SKuxhuIXrc78xoAyWhMt/10vhCBKEqs
X-Gm-Gg: Acq92OFTcv0B9Kvi237jmT7vFZvHs2nKjlDSp7kkfF8iOixDlinozYOv+T+cooXwBsJ
	DFKYyqs9cFxAGAXyJZ3MYPsQmrr/4aSN1hHOyYMYPseHwfYv6xWhzuVqYRFMYPrDQWGbcxlpSIT
	jDDbnO0orJQvZqbo6s3ToVe4faF+nqmMsSo8IeqdUTbZW822LrS1BDtBOYPTY7Z11NsL0f/UnXa
	u6Tt7spUBbbJ/MyVViRGq69ZbExjd7FDKcV1cUcuLfAgkhUs6qCuVF8rFAF+TiB1+5kdzLUZ1Qo
	o7ezcJ8O2lAkWYLh1UdxGLoLQHRVmA+qGNQw17ZUMbPwU+HNGFJNRV+TYy4/CgHxx4cHjHpLsS0
	Eydw2AJMIF7/zKc0sKQ8VtX6V28yKNaJPrV0SBSrJWV+6xA==
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr126389881cf.6.1779713731903;
        Mon, 25 May 2026 05:55:31 -0700 (PDT)
X-Received: by 2002:a05:622a:8d02:b0:50b:2875:5782 with SMTP id d75a77b69052e-516d43a2865mr126389501cf.6.1779713731405;
        Mon, 25 May 2026 05:55:31 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bd00e751sm3897925a12.27.2026.05.25.05.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:55:29 -0700 (PDT)
Message-ID: <60f01a6d-015b-4a6d-be53-a5394ef0e037@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:55:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/16] arm64: dts: qcom: shikra: Add EPSS L3 interconnect
 provider node
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
 <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-6-f51a9838dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMiBTYWx0ZWRfX/cZTUZnyOCQb
 vKDUSrAxf4s6jWcvA1DDoWsvmOykCRIpKKO/S5j/J/deTKnUIvTWUx20OkaHbRXwTgD9/jyJ0K2
 0ryEuP//LOd8IQxdUmCLvdXTN5CafPY7J1LVcLugQ9XfoK/bgCGF+LIMHaQy9bVerhKNmH/QFO9
 TwunytnkCFiDcBXWElJ5dPOmf22tH4GrFUzZCTs6IXjYuQlRrNMdjmJOQk9nAhPcz9nP1B407s7
 DWZxWkPHc52kv6u1a7HXMaRRObkGs7R8G8JwrtvJ3fvywOiC+WkVg8tOCKw9UuSa4qS07WDAXo6
 9y7dYFI724dQ29LdNbS/ocqXmNoBLEzjTLzaWVc9CoVLBjFdCouuAKJ30w5Fd626+3/Ypqz6N34
 2XLcTAGsCqilRFHTDwkH9VtKlt52XN2OyFLgXT9Qvcz4Ok+pw2PW1+hi1AXhsVgaZTYsd31e7Bs
 eSN7n28Y4OBg3XojvXA==
X-Proofpoint-GUID: 1_q1qZcLWBf1Lw03zTcXNeIe0F9BAtFs
X-Proofpoint-ORIG-GUID: 1_q1qZcLWBf1Lw03zTcXNeIe0F9BAtFs
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a1446c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sDloKVZszu7f_yhO33kA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109657-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 362D85CACBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/24/26 9:49 PM, Komal Bajaj wrote:
> From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> 
> Add Epoch Subsystem (EPSS) L3 interconnect provider node for Shikra SoC.
> 
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

