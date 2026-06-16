Return-Path: <linux-arm-msm+bounces-113399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gXK7CLQ/MWpqfQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:21:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDF68F40D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:21:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N4pWvAlL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IGRSs0c0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113399-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113399-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B81F130EB3C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E21369211;
	Tue, 16 Jun 2026 12:01:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16EA3DD511
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:01:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611294; cv=none; b=dClIswrlZVzxyP6GuIGE5FgWpXRbxzxi0FQshpF00DHnacKmj0Get+HCQP7K+KkqssQjBNyiT4hAVX47xaRBj6QvC00+RGRvf3GHEyJ4KRJsphO0fLrxfKUyI/O82qXRfotatTdEmQyFw/GS26trHK1vI5kSH6FRXGIkk8ykJxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611294; c=relaxed/simple;
	bh=hynp6thCVYAmrL6SqdYPRJ7dHOMNvaccD5sK5f6y0wA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlUgXIMUqDn6fBlciv0iqyJ0eVFKDYUX1vdsbEJe+wCM4BdwKYFxtrWR9P1YNbd9B79ZKN4SKAXGgmImK/kk3bmn93vq2lL+N/WXA+5t9RM1yVKABnLwAceqxcbAOpsisQK93X3ybk7UIWioZQ36WYulRykLzpN5sK3nJ8LUfHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4pWvAlL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGRSs0c0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9QIR249149
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=; b=N4pWvAlL7Eq5FdBW
	D2OVPhhhgJ7AAWanktjR2Bgwofm/NadGLvpwoSCeFZhwW69aseJi2WK4hANEM1MU
	9lru7heSSoQCq1+j3NXBNAp8hnaR0zS1hwlhwi+YbYLsWYTtskYqG5KzE8UdqY2H
	3FcqidsPJbIAT/n8bBDA5CqYFw0rK2Osi2i5+vGm4tt8iCd0tO5AqBADJoI+VM5s
	WrhPkXKCgjAZvHhXrcq4Y9qNbzc7Kv1LWm4L9vKvljkggQqoTytrZnKOTbl7r/o6
	TfNEkrjAxxl6dd4Jo3q5AEe/gHdCiVTEYBonGRU0FGhYFFbICchGjk+fPMNecLcO
	7Mz2LA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs8vsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:01:32 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6fe5ab3b0so748039a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781611291; x=1782216091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=;
        b=IGRSs0c0PwMEhV6QDFO+JearF7RvOWStPKnw8dVPVwpoyEUG3W8CgCTHfbEPmPTigx
         +ivQQhXotTqhqZQLvchO4j9cpfHCvJd/qtrzqZEx2WtnBl7FZmRHkdtakptS+WgFcgBn
         EGLkzHcjCzVqCxioHi+jjPPPGENCRt9wzdwGVgG+EObOnoQ5zArP2nt5PoA09EnQ1GSP
         APuxZ71/9V5arwOD6vZpJommidyb/f7lMwPwSD7DZKme3lyhbnhA6+rn01jzAtx1Kvak
         uyWNBtNeGg9XBYxlp7/FcshQ9l9l390Hrx09ZTYYvxeLwsdH1Sico4A9xpmhr2KVw76d
         LNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611291; x=1782216091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JlxpDVrPhg2ZsWuRW7hsIZHghtGrPTfnyImlkmRxEU=;
        b=eU3A/uOlXT7Pzsu6DkaIh9wA/CsKoKlvcdlkDAMXYSk4Xcp6fWu3wdZr0OIHIJb/qm
         ZbynrDOIlYAFcOhljl6wEzWSYBzgCok0ikC1dtbsIKUrOticof4HpmunSA1PKu20Hlel
         huvYVMsxz52ptfCTSqbBFltWc84228GLZIvKVsyzd9mNoanf2waAKivAqfYYoCp1n2xM
         F/2nzhlFceH4a33Yeoz1gypV0u7mhvF+qneeBzHulQq49dPR50ORdtFeXH1sEeTBXcrz
         IBxYiKe2fSIjknfqpq2Yxt6c2eTSclLZKihZNugZjUk5MnQoeRYfyBgyueSz3Cgt0zNc
         kmJQ==
X-Gm-Message-State: AOJu0YxzP+ojiGpzeU4torDzXvZeA2J0z7KyPS/bzLzQMn313zcEaxmG
	UQVAMDEpg0LYfJek+mG0MExwXkMQfnU+45PSz/+auw7Prr6u6DoUv2q0AVerXECbdhZwuhpItFH
	Qck0HnM6U6oTyOaLY59HfRG0EKyeRHB8vSxkSnrbjBubaw1Tvc6UfBnFaacVw282wxz2/
X-Gm-Gg: Acq92OEaDGzxdo+pqf+xHrVMFD3MhG+Tr/fvwaFHpAZPujFxNOg9LYn/i7DjvymBhsY
	CPXxZDlWhj7acGtkOFEGBJABVUPI85awjVFn9Cp8yIzFknA6+cenCcScvoS3mEAMJPIgZ1DC+pd
	NuF4f3yDsREbqzo2m7+f0Cr5A4zO6MuHn+YJ0lbBn+khiqzU98SiCelEaOUlFaT3H1DDlKYC+oF
	bNGvjgrV0WtSvP7IN9zqy24I70xZ7M8tvs5ncamz4DUXQ5gq83CO2THXqOUCma3uY8qA2zvRqGx
	C8ac7ibCZzWQrXsXFMMjLZFwsiqUbhkGXil9FxlYpGo3xttYhYqTXkcP0cWnhNXJKWwGqKelq5j
	U6Hahr4ZdX32FCOqIzBXUw0m+4LPoDsmYLSMmHCc8dmygOQ==
X-Received: by 2002:a05:6830:4115:b0:7e6:e162:913 with SMTP id 46e09a7af769-7e7847583cfmr7195429a34.5.1781611291389;
        Tue, 16 Jun 2026 05:01:31 -0700 (PDT)
X-Received: by 2002:a05:6830:4115:b0:7e6:e162:913 with SMTP id 46e09a7af769-7e7847583cfmr7195385a34.5.1781611290862;
        Tue, 16 Jun 2026 05:01:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb5223309sm635175666b.28.2026.06.16.05.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:01:29 -0700 (PDT)
Message-ID: <8ae67f39-3faf-4db2-acab-ec7149215bb1@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk: fix sdhc_2 vqmmc-supply for
 UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609073509.2453273-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dU1qekbV1n9SupBdzvVH7xnKRoW7Ji_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfX1aA9B17bVytb
 Hayh5LKgDrNR4Gm+xOV+K8Qk7PJXpMuAWuxUSWzfsu6OrIbJjG0KnrhMrDKjXbKULkdiLa9AlrB
 3CspbLUQd88v8fzTdZnFTqhesgXlr5mo3L1ORb3318Ammemv7R+ZNj2C+hsRYraPcFX7Acxagsw
 ZHVrU+3w6sml8W7oEDFarwMJFJsUxG94wz6KP0zP5+EGYUdfYYGmJU2kvPpSBqt2rqH4b/GYpDs
 5H2Vv4BEdqiOTKLAPe43CjUiu7krM67/VvahdjwzMCj/B/WVuW2wdjinSe/6HhhaC/hReOTDV/2
 I+59BPqBCHGimbC++BYLCtnIC6bak+lHwEb2wsuaoX8S0WVsUbKfuYcd0nik0pkUX/Lu4St8wE2
 1kJ9VptNrh/8UFK3gumuDQIw1j6KuiwGaAAeP8WoxX8k+7UOK8j/wlZa6NRFNVmwyDhXnsbSKZ1
 KogXObIoD8+QDsenNtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMiBTYWx0ZWRfXwZY1Xe7jGHZK
 fJxBALvsf6v/yElg+6m6vATErzr6dHtk1fX6NyGJCKNiGTjNZuNl0aQnKthNw1VEmgTD9laLmXd
 FbTNwA5K95GtAr54qcqgaldQf8/8kes=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a313b1c cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uRqv5Ot6X4B4uVllIekA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: dU1qekbV1n9SupBdzvVH7xnKRoW7Ji_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160122
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:ulf.hansson@linaro.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:jsodhapa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113399-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27FDF68F40D

On 6/9/26 9:35 AM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.
> 
> Signed-off-by: Jaypal Sodhaparmar <jsodhapa@qti.qualcomm.com>

Incorrect s-o-b chain - is Jaypal the original author, perhaps?

Konrad

