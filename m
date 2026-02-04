Return-Path: <linux-arm-msm+bounces-91808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJF1M5dIg2m0kwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:24:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6EE6610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CC41300DD7D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 13:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01A4283FDD;
	Wed,  4 Feb 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCRuGs/n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aF1959ga"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2F279334
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211469; cv=none; b=rWV9KXt5g91i5D5wceNhfix6zjB74PgOFIM7G60Z1/0XbgWBYINDlDS25kvqDgmuI6QSJMDGj3s5ulKbDEX8heKMx0uV+/33BPL80jG+cF6TRfPL/2IqccJMTKcKxBEVnPfreoWC6SpTgF2T+AshpM4KLNzFgoyI5HyscCqE6F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211469; c=relaxed/simple;
	bh=IJJcghbJp7W5Sbr6vQDJGx2kFkXqXHDiyIdWsZbQ/Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBDVL7dWsLk7WwxfoQ2DSxw7TzgG1P0fNDkl6ujLvvfatI4L0uC+oSMS2DNiYWrwq2+yDSdZC8BdjULN0s0Jlt68DZbwan2LKuErV57YUv7shac6pLm8X89XBlVUTbtob9zTLt63DQqDoabCqMhYaFq52kUUF0hTm6jClfkFcOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCRuGs/n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aF1959ga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIfQi899472
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 13:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WuO77aIUfSKWOvBwLlg7xgpIE0DC+kxmXo59U8JAZYQ=; b=CCRuGs/nTA00CNiu
	wmmkwe1Ng5FIwZQMGSu99HRzO4rgETVWk8R56YdFrsLWprwkbkGRtOwJ793ewEku
	F+1qIRYE4C0fFbpHkbDXJHgGwptxewFsJfRFj7KAByyZxfZOwHdMUVIi4fKvdjme
	Ak8vJvlpWNAuzkfulqoKgh3ctbtTSU4rdLtTO6me5jOE36H8XPIhYQSdUyDRd+SK
	1O9+fYzlwPs3VBREI5Ta7SS01GNQ7ZbEh9ryskkP1GmeKloJStt+2sQtMUew92Fj
	Bld7QlJSWO65eoNLGHsqRout/zG3TIH2B93PwHDJG0TcnVo0MiZw/4nJj6XpZOVs
	vYHP+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c445wgg9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 13:24:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so204175885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770211468; x=1770816268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WuO77aIUfSKWOvBwLlg7xgpIE0DC+kxmXo59U8JAZYQ=;
        b=aF1959gauncYWrH8EbfrqEAY5Ui4/VUYCGJQJi7f39h4dmUcFZiupjtB9+Whu6rf46
         k1QgyiufzJzBPW9086+LRocUD5OUy0UisfhcFASflUmgK5Tdx0cvMqOqVfwFPzl8e05s
         syDCOtXApr03HJ0f4WHUoPsVOMZADKYr57apa+mY6wy/GkWpFGThJ2cCkLg6g/KBZPN1
         /pS3S52m0g3tPFJVE4oYLLs9hkhxcDK5qc5VWBbg7hsuGk5ECmr6RquEKjv2LhIqE2o+
         XhtWuUPcL+ql15B6hhZrcl4bhnXdo486vn3s8JgVoJOg3cI+pkWilg0h+Ri4YTt5waER
         VlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211468; x=1770816268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuO77aIUfSKWOvBwLlg7xgpIE0DC+kxmXo59U8JAZYQ=;
        b=kDKXKQKgLNEt1lSFffSJ0B77WM+qu3bsPy0iazjv1jnodRDjieBebn3tqrHmimENgF
         Ts1NKigBTw4hymKHZaAW2uTY50LN5MEKu2MYwTo6ZnL3d7el9gkBZQv/Xc4N40F7QC+C
         CfkNXlfvDpwcSWG31/gRPwjkNUf9VKYe9mne4+O+Lrb3lJipUr5uNjPPD+tv0RuHxeXx
         F1lZdToPFaes/vnDPsBoUrxk05Cotf/UASJdXpGwW+gHSgkKnDJOFm9fEo1rvUJvF6Wb
         dN5c61rLrmEPyl7Q4hFjGdXZz3f/ncqeJG+nAyh6EpECJK/bP9nk9eGohxizU9iHO/r3
         Czmg==
X-Gm-Message-State: AOJu0Yz0ehe7KNPcvwgETlv1A2LkqqCDIlhs/+r9lYFhiA4SVVWswixf
	cEEOoOwPjTG+NAcg+5EcsAuQMMRJmSqYNBd77qFxG5utT3cYRKaXh+uXZ3CPbcGznLA/ZzCuNpX
	EZA8euKZmbkKT45/ACtrTVAIU4UEFSbzZ9zNwDHEjYT24JiRCS79QAeZW4FAwz9awQh4e
X-Gm-Gg: AZuq6aIQk3rKaB88hndbnYPomrd0Jfd+h2rc1nIDQ0Czoxs327mP2PjxLEmoU1w1erT
	0cp3+LGgjJo3WYhondeFt2vrVNgCbJ3NBw1nxYSgQk18mwKF50HZOZ3UvhWwihJD2SmpMD9kFCd
	2gvBXCyaldADTCHhP/rl7TqGzo+FiqTOkbjDmtY9oUgb4+kG7JORwzv+z9idr9rMSS3NV253b1q
	sgdcWAr1qwsuWGKthwECGIP2wkk2e8FSQie4GVL7jUGPoiEi0mNXrz4If9/iRfaab745fOrjt3e
	Mj0Y++ok5BJ2pxLXZXsWsTEr2RfvxofHBkIazyK6sHnnA/Sn3nSL2XWFeBDSXfg9jV2VBoPTvLH
	CIrDGezJE4BbyKnaZ/nQkp+ZR/Y34L4dDz1UZrX6Mi0seGi9FiuR0cVb63bFnPlySGCA=
X-Received: by 2002:a05:620a:462c:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8ca2f824267mr295290585a.1.1770211467912;
        Wed, 04 Feb 2026 05:24:27 -0800 (PST)
X-Received: by 2002:a05:620a:462c:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8ca2f824267mr295287485a.1.1770211467448;
        Wed, 04 Feb 2026 05:24:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fd12380sm121795866b.21.2026.02.04.05.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:24:26 -0800 (PST)
Message-ID: <f1b58609-67ee-4df2-8430-19e7e4b1f30b@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 14:24:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] usb: misc: qcom_eud: improve enable_store API
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-6-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-6-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMSBTYWx0ZWRfX30bkCWav8mFW
 mxoMw/rEOKENbl90TeReEmfbOH0KNQINYakcJNbUDtmxxIB1FvF1UpgsJWcJO6pfkzWvhCQ4Odk
 24mn6zfN+LG7a++c5MOr2UxG3g6EdCLusSC26wdqI+5VLwIjfdYpKvQDoeJNb/qFG1q9U3TKKNE
 hQsUF7tRS1CkFMsby72xyLjWp8M4xzsO4ucN5HOLFY2DvUisAcote62IhP7EJKiubFhjRKHQWDY
 U8wzpDhbp78100p9o39MYLmx/4rSmtQBt6ufX54ImLYvaGCpBUGDC1SkIdGXIK+TN8TxFXSUaNG
 VXxfMNmkIWW6EokHzohe5yx198I6YL5cgI/M7X+UPnU628fzJDlm5+pHCMct0ohsnc2/XRmbG7t
 HvrRhDwszyRbg1oxRlEsDCJib/wJv5jsICuaxqXB6y88d6d2XOu0OmJjInq172h2zTuRu6xW5sq
 hdxG3EDdlDDXkACatPQ==
X-Proofpoint-ORIG-GUID: wios3_6vm5tcMWeT0jhUMdkgOyBhATiP
X-Authority-Analysis: v=2.4 cv=GvhPO01C c=1 sm=1 tr=0 ts=6983488c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CZCQS8drd-N0E_F8xdgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wios3_6vm5tcMWeT0jhUMdkgOyBhATiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91808-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50B6EE6610
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> Currently enable_store() allows operations irrespective of the EUD state,
> which can result in redundant operations. Avoid this by adding duplicate
> state checks to skip requests when EUD is already in the desired state.
> Additionally, improve error handling with explicit logging to provide
> better feedback.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

