Return-Path: <linux-arm-msm+bounces-99194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAuqDkYZwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:43:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7E2F0644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DEEA306A3EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E948638C43C;
	Mon, 23 Mar 2026 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8dDE2zo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEdQCvSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C738C42D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262198; cv=none; b=AqKQnFIGKOz9g1vU5LegfgY2aq7mv/imWsx/sUA/6blPx2Jva0/pW7SamOa+J01QeTp/GGySEfPNuVJtTKRw7JCruRD3E7PMKcRrd1pUjjStgoeGxxahQgE5g68KswgJzkJ/hBi11xGpP7gdQPPrAbBOmhp3M2Ipn01xXvhdQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262198; c=relaxed/simple;
	bh=qntGGfYTPatDR7BRqAfkoZdSaFO/huuLIiwXWRDHbWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AcQiVivNNJ/c+YlB0EkKBqdjfnBLp37ECkjtTgEb+p+rMnKoTpC2xHZFFYidzJbnTChOX8WjuhvdCqtvt99IL1pk7wUrkYJrRrwp6aghFlihKEd9JGSY+LmSfMc9o7ENlVMV4DbfbCISVu/PBKamnJWfp/VVXBaVDmOTk77+iDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8dDE2zo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEdQCvSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUPl1627050
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OlwHQJjOtdbVfaEECfF81aOlln6ZwpshefwMCiiKZ9o=; b=X8dDE2zoPImUp++N
	nZTZ1XUMV/7/k3hqVu+s3ZfOZuEJyWMp6+CU+ljpzYsjg3Rdkk4tDm/GJ3X2V71g
	rI2jWwwaItsbOkhuF2zHcObnOzEGDf/KhxkZHYtBU2b0AjOciqhsRFLMhJWlTMSk
	FInHVzbCrq86cCLyH5lgCMQBVyrs/tedY7OZx1awGQmV5vj34u+/F+sgpjKME8p/
	sJcN+DdQL36jrQNMFqOXrZ6lNxTqCbTgBuhbV+jXIB2GEdXlDgJqe/3Daa2gdun8
	THY1S+DMVnug4L2YouIYzK4awQRauMBdeCS+mSYpN9vL+5+/gZZ6BCaJOAdeo8J9
	k2SpuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0jrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:36:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d5e61f6so26038131cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774262196; x=1774866996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OlwHQJjOtdbVfaEECfF81aOlln6ZwpshefwMCiiKZ9o=;
        b=GEdQCvSxPTI6aG/tI23yxIHjf7zNv6Hzu1JF6lSMof7ApE1tPK3Z24NyHfkXIzyZuJ
         Gn9yCMIgBA1gcnA3OsUPldrE7Dsak3om9S8Z/W1Ia7HsiWjEc6Heh03KyGWBeW5MA+Us
         k8BeVHN1jfLHneKcZmqiepjRqFhNWjwwAn8vcJP81pUd/kW4qF+xjPhdZvPwDMAO915z
         PnfKXIwBffnzdYp+Ooa21aKJjKnbsszzl+eQary2WcoVrcmxhAzbysEfLt2AcuQYbmjO
         JwYHRalL/eBrScmrjJJM/JgOviSxZxIajqv9GKj6KObKpnvEKawguQZ7CVdrUnSiPy6Z
         LgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262196; x=1774866996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlwHQJjOtdbVfaEECfF81aOlln6ZwpshefwMCiiKZ9o=;
        b=LP+RPj5vnMGzJ6dlEK9at4WTyXrfvXNqZUTY7UghiQnE5rtyqrGstwRoGfpUOwHVtz
         O6w3n0pTkRQuc3VQc4hcAFpKiHA6cysUWEq1/dHFbT8IO7iW3DohepMgBFEslMwqow9S
         gI5JWPVlr4jYtMRE4qoVY2kek9kAswnWvqDRhMisuotp+ZWShcYmtU91kxmu3s7GlfRH
         hK/jMrND7cfTm0XUC0w1BH+WCh8DY2JQjIoaEaR4FeRnq3qipGf0J2DjV4/OYLPdECxM
         OBh8fjIHw4ieob/tWfgHdnAYyvMKW/v7WgRmamAf8ttZn5SJzbGbh2b7aTpxnxBlt6vx
         KrFw==
X-Gm-Message-State: AOJu0YxKr/U21RaH1zLdzXxi2ItAD6nDbktu4ilpRweH1VzeD2pWLaj7
	zqNl/VAVQwKLdqiMRmmBJZaL4h875UslokNjbuY4SQwzs485jSTT0pTSNhlHDAXotvrz/kkLqap
	xV6xwWvOOaVqwcXGtF3rv/C5nkcXCiOBUYZ46/jLaqnfFUnVRNq6k4xS6XO6popckbWHX
X-Gm-Gg: ATEYQzxk1uSzPz68iKkhkHgaQ2Dn75YryV3wW8k7YoGLKVfmANp/2wlhJ7ZQ/S94bHM
	AVEKc3GZ7jgjjVun1CK0Hmq3ee6jHjqrPNxgfGWUOSbAGw3MlCQp/26NlBV4Aj4GqHMWyPK29Mv
	WLQWf7NvIFf10mhKcbPXbpBP0WJRkw9wzk8EDSGcNb/bB3G51dDSN2mHaAGwbW4UOWdcmf+ZIOX
	OoRhCAY6qrDF7BUXqWsw5YnF8PU32OqmZEHIFPp8md//4t/MUdPa1ljxg1uI/e5nW4mh1A6784X
	wiMR/o17mFtH9JIcxjeWR3YrZDFEW3kn5VXBFaKtP+0bSQynxcXykbnfOe3SxfdI/gWLkIY3K3X
	pSWrqpwHhXYVPanJTBrbXlV7jAkaaST0r3X9e9KE4FOUq65RJ0jiz/Cy20nniRDA75w/wYpvb7A
	Qp7cc=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr148047521cf.1.1774262196019;
        Mon, 23 Mar 2026 03:36:36 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr148047201cf.1.1774262195624;
        Mon, 23 Mar 2026 03:36:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8da12sm479371066b.21.2026.03.23.03.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:36:34 -0700 (PDT)
Message-ID: <eba921cc-c63a-4c40-8c0f-f969da67509b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] interconnect: qcom: let platforms declare their
 bugginess
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-6-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c117b4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=gOZSry-tN7A4fIUc0b8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ZpTcghA5Ks2AqyM-atbYT2CBRK3XHj54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MiBTYWx0ZWRfXzEuYl41vliCb
 yFnZv6bWjE6UHKiswZy6C+r1OlE/HqH+TWUmobXDByXdPmN18yEzKPRY0IgfcjvFVyklJg3jEPY
 6Pz4waJ9J3E+og6e+y8d3DEmJmy9L/r2mVxJPFV6pc5q02grzehfIX7m50SfkB8Ald06DybGu9h
 qSs2hU+5lW48fJ6JQcNmE4gOJSyiwNOGLAq/yEyCylwK+cE1zublJEJKijwe3Z6Ves7nrOpry7V
 WtQQercf/APmXyyBfyVSXVbIBL/9mpc1qpOSHhcHrZGNVPAfiWehVBKBEzcOMVprqDqfGhiKXix
 p2hE+jlSipZYbkM80CwKUNLc7goQnDUa3eUUth6qWOWvx0E/BNrq/RhZ/wfTNBLf7udKTSLucP0
 UPsINkFe3I86HcsISROYIx5LslE8YSC4Rhyc2Iv3sSewWRFuin0HbyzPhiJt+SxRVNc70hGPjLQ
 mdfqVVn1gos9LSSCQVg==
X-Proofpoint-ORIG-GUID: ZpTcghA5Ks2AqyM-atbYT2CBRK3XHj54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99194-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2C7E2F0644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> On MSM8974 programming some of the RPM resources results in the
> "resource does not exist" messages from the firmware. This occurs even
> with the downstream bus driver, which happily ignores the errors. My
> assumption is that these resources existed in the earlier firmware
> revisions but were later switched to be programmed differently (for the
> later platforms corresponding nodes use qos.ap_owned, which prevents
> those resources from being programmed.
> 
> In preparation for conversion of the MSM8974 driver (which doesn't have
> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
> that those -ENXIO errors must be ignored (for now). Later, when the QoS
> programming is sorted out (and more interconnects are added to the DT),
> this quirk might be removed.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Not super happy about this, but since it's transitional:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

