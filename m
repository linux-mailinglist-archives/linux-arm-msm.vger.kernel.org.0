Return-Path: <linux-arm-msm+bounces-118286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oWNxAj3uUGql8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:06:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09973B0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:06:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RG8cobAt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hkwt7ETX;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118286-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118286-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48363040412
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1414F1DFFD;
	Fri, 10 Jul 2026 13:01:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BB742983F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:01:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688467; cv=none; b=b9o7b93V1aC95RAuIjMsZg2kxx3fUhA2Mbq/7LOmggEOgTlKxfGGR8GGwLVY60KYHHhI6rpkTikPQhk7nGtTj8WE5CQi7gcKBGtKEh6t8Egslx9y51fXnJv08lWtp/t7wxu55d6pMJlqpQzL4bihZ5NMETT8r0JOwTPqPII1Azs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688467; c=relaxed/simple;
	bh=IzrIYAqK12+0DbBs+SW6tlw64V962i3LE/L8V8Wfs88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwKG6B2yREfJMOxULs/E51IC968zEIcxsy6R6uQtp9EYccmsEq08ne1n9jXhaw40yo8+8FHw8+2mFCUdWM6E5JBsT81Pi7w5RdFp9p3BDVdw7uegJZ1pwl7WZqVEBvFr06d3aops1c+mBwjmlGYSCeXih866DYg60wnJBu8DymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RG8cobAt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hkwt7ETX; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAmPof471742
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=; b=RG8cobAtccDGy9Fr
	A9QbasxRaTIXsbjqafaS8tG7YdsU+vQPGRcsz99XdzM+KYfMCM5e2ogfanq16Jip
	ahjrWVSEWyR9lglhEKpH90gSJWEq7rWlfEvI8TxeIcueDAI9pizb11FYyTxFyvhg
	Jcxox2SYibdX9aBJG1FeNjLZ9dt8w0XtapRrhVooE3HcSd0JVEOeLDXdcYWeBnss
	U7K6KaqOHJe1Y74Bh0odf9X1qWCL6h9+ldyfbLS04Z6HxJXU1tWEe4Zn112XvUyQ
	tNVLyNMvtQYHuOUXjKVTJxmu2c/NpIht2UJS0STlXo+3E0aj9zcFppqBa6PA/Ok4
	jBCX0Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5dgqn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:01:05 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4877418ba97so116115b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688465; x=1784293265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=;
        b=Hkwt7ETXbkdqRm5Hapfj9g9/jIvjAcWvPOTd2O0HE9hUgOnKjz2Of9w5CB4q+I1DO5
         zAXaqugF1YCM2gb0OkKQ57lse33JyT45imMTw9tANwoN5obrCjAH5mEdaQBQkF0Qumzg
         8tuWVizcvGfsCxAbbd/uGQA9b1vr0fbRNp66ufp9AEbEwpBR1Fb9aXYKLvaVBPu++WtX
         ANqMQTaWgiyu9ecH222OZiKnevAKNURIBrLTsoGGF9hFUGm8mCdfPco30ZTTK+Innubg
         MhVOTlR5NVjBlbMj8haKCGkEM7IcjmLoBDVsLaQBh7vBgP9atNUrS8fzYutjWZbFNgpD
         t0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688465; x=1784293265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6f4ngRNf22D5k1LmrlO8ahcDEww5AcgtWpArh10h7pc=;
        b=WG7lkjztyKPt+w0u+RPELBuWxvXpc0i9dgrUZOJij1lM5AYVmuYE+McPVMUywnmCOe
         0Moa9kzVRGUb62ufFhafG4fscizlF1kWVYjIfK7ou8BRilHZeJao/AQ/7ufD0hZGutad
         VS6ng8/6lNE5KUFvsEpk7OXn6Ei01OhugaANfXTZn5ajiu47i67ThXoqxcZGCY5ZI4bj
         ceW4+rCH7ds0ME/zroPC16LfGHSObBBGVoC9w9Qy5Ot9n0tbKsZaVwA615mCZaZjenLH
         V2WuYMuMng2pVteT6y3b3nwX2tOmPTzunB+B7VDkUmkFauDv9PTh4VFX6uQDXtJQu/Kn
         Y7cQ==
X-Gm-Message-State: AOJu0Yz/ZA1BamIXKHRomz6xZHa0InRoq9aVR5ADETg7iVoJVMvPth3U
	1Jo3mxaIvRKUfjx/CgsI2L91XvmUVajm9QH3EG+4f8q7mcKmGdUNj64KMyVUKd6VyhbnmNV8I+d
	JMmyAG6t4QM1/zV87pc+CG5yvrYtdRw/2Shk2UfspbVkX/RAh3eNjh4H2uRwGb2M9hhGe
X-Gm-Gg: AfdE7clRE2laPbxOYO60aHMq4zJkr87Te3FuES5abxS0Je3a4jUFZ3e32T5GBAQxnIk
	lmxEOgZu4USkc03imQ/eW/xL531+lqXgFKxrZzGWQd6G8IrJglYOW95OuLj3pTBUJzZgi+iFTlM
	crs3COFoPdI34hr3SduXDvHKFmIXbecv7Lr/QhXj59DSiUiThes7u1qI5fdHvtrZkgTtEDA00cl
	GX5h/vNq8+1G07VqE2m4Q18zZ8j61bMcuYXn41jgbB+8+buzKgaO4ZseP8MxJXSjxUYFXu50cgu
	gNDzV4FplofNeQg+yixnncd2ODzpTBpcRnEx3KmjGhuj7tHkSyVdzTQ+OV36FYb7qROwiqRGdHH
	QDmqn/7KJ0d9qqna7VwK4/xXNROLCl0kP0LU=
X-Received: by 2002:a05:6808:15a5:b0:496:9bf:c837 with SMTP id 5614622812f47-4a2f430ab1amr4763004b6e.0.1783688464660;
        Fri, 10 Jul 2026 06:01:04 -0700 (PDT)
X-Received: by 2002:a05:6808:15a5:b0:496:9bf:c837 with SMTP id 5614622812f47-4a2f430ab1amr4762978b6e.0.1783688464172;
        Fri, 10 Jul 2026 06:01:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd1d32c6sm3595066a12.31.2026.07.10.06.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:01:03 -0700 (PDT)
Message-ID: <bdb03f28-4f5c-44a5-b2d8-bb51ecdb377a@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:01:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-3-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX2mflOUs6okuG
 7Oezc6GfRIp9dse347pW6dnt2TLlGx8/JQ5gclv6/sdVVoC1vy2Y8M8XUppy3HvhgM4WHDIblBU
 HJwYfhuiSSnFk8ubE0ZeIXM1ncN2reM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfXzKImUcAlsoVm
 57JwRy7fVyH/xlU0pZhecQIxXhYT3+PWDpLjRIuJCTNt+JUfcVXvQ58bIeHKqYmqu+M1dH7V+JE
 mWEBDGyyAeuXpwzd1eMlebX7g50sc+UPcr9NLBw6xZ7HQhstqLNiY44ZP5xtAupXGJqQ/mTDT+O
 5aPjj5JaTWboYpMbbvNjaFTM9/Ind2Tl/E8yWsosCocLzdu2tVg6/oTrbms1ohvSwTtX6Gtgz2E
 385W9mxNzya+mQCioovP3Od7Kug5YGm92GVWJbJJd+CT8Ev4xaI1w2JyUtUUxM6Qjoz2PqU7EmW
 sLM/Bvtyzs3XJ7OZ7eZenYW8PqZJulYwl6ts9LhMiWdqChJPnHYSRoTR4fnLdKvIrRu+mgD7X1w
 KsjiSh7g+fQ+q8XXSZEvyh8qpVEbAbdx5b8ZXdsAYXh2PvgziSvZexENlxzfbWcuJzw+1AWWJw+
 YHABeLoNgiC22Djuv5w==
X-Proofpoint-GUID: c8JxCizgObWrtWvGtIszxP6Ch-yyxV61
X-Proofpoint-ORIG-GUID: c8JxCizgObWrtWvGtIszxP6Ch-yyxV61
X-Authority-Analysis: v=2.4 cv=M/x97Sws c=1 sm=1 tr=0 ts=6a50ed11 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=s8hspuRcmIiiD5yHkK4A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118286-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C09973B0E2

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add ADC channels for pa, quiet and msm thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

