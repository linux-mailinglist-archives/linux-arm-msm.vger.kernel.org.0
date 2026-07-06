Return-Path: <linux-arm-msm+bounces-116737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l7UvFnF+S2pHSQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:07:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5ED70EE77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hj3Tjujw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Sx/W4pYz";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83C1E3026017
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 10:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F83642F719;
	Mon,  6 Jul 2026 09:49:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C042643A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:49:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331363; cv=none; b=KnjDIR6+/ZXWI0qa33wGcNsnXzhGVqtH2k0lN8n2oti/rRqEIBD/wcaHmGFouDkfUqalsd9U3/P7uuBBM5YobrEs9h50r4sLbVCAs3sHhO1wUzmEGI33DxcyzF+sjwAnY1+xiUgEeKS8lyhrODpCj9xfsPjaxu3HU0a3SzUKFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331363; c=relaxed/simple;
	bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYhHn2I509NBn0dp076/d9g6IlCg6Xw7Y13a8q1haSBlEdTv9zqsKTKxDA4iGzQc4BtrkpYu0vZgUF3rOMSsMaO1RHTTt54JNZUatu+ZS7llMrE0Zz5V24hVxPk4dPH2TNPBc5drGIxdH+nGTdwVRvAzmpibO9I0Are8qNIO+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj3Tjujw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sx/W4pYz; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693xLB4151646
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=; b=hj3Tjujwhl36UrmW
	H2QYCISUJdJDfbMUO2Lw6b3zjY25Z+aCiglzIuLaRrqY48rQB2ah8PaJL4xMVQEl
	a6O9lnUj30gDoK/ubSOke1NfCP6YJOvNp+6AsNSIAQzjJEL1WRDvQ5sFhsanV3xl
	Ms5KhCCIsnDfKZMew1rFxYk4Fhlhjskg4CtPA+TdRwN7Q37Xj7hH+tiIK3k5QUOL
	gVzozbjAVfF1cOzmKuyX3Jb2+FCFy58UK7SdXp19ekxqA4WjH8sZOe6f8NgCwWz2
	sTcKarWIf+fmwRdjghkoWL8DC8bx9VVGVMJE4KGJ+kDK6lIx5mvGh1IF979BYUHP
	h7GkkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs8e8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:49:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6cb57d25so88978385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783331358; x=1783936158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
        b=Sx/W4pYzSTJDYHgmjzvKXGX+aexGC5bqn97JploXTUf5or2vKihAh3Ra0DNLHkRu/0
         0Hl5ftHHXtLv69rAtip426JlDeMF5xy44Tl+iokHCAyt5/XdId5rTZ/qnvbw5ADuOSAl
         cEpwm4OomYMdPmwsT695IfVaX2RBTStUpKgQ6JmPUmjb5pUjJJ2F9U60CfFnJt+HfE73
         /6yOqkHORm4Wq06qL+1gx1/0x4WouvHOPNOJQ5HUjKtlJq+9HwV+VWXdlBrAIqxRdZcp
         esWIFd/gpplC7MyhXrakU6tzvdnRUJGwMWnsOFDRGSnj3yYzA4pw1KTk80sC93mnyV5g
         BmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331358; x=1783936158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuf2vryU3oK02+rbWYpjvQhDwO6Py6xH0zvCGEseqRM=;
        b=J06yTYVNZZ2t9wSvK/XJAJoenWl/PwS9c7q6MFvXc5TOd0PqMkEE2lcCXn80CW8CTc
         u43ai5STVXwstVDi74Sy9Ol77WAy/3GOZL4f3b0Hz9wl+JfLxOq9JKnDiu6Nf5y1pye4
         Z/HGWnTEyFb28r6NCxssTCctJ2O/SoGAzsCWoxLUgZQD+QUW/uDUFWZTmeRkfIRcMR3g
         y6abIBVsdP+Iw+286m5JQJz3C2rVmeOU/rOlq4zRjjgVYGtnoYtj9IvXKUzPDvtqJfFm
         zyPl+C75rWAQmeujijJOmJdQfPOV2JNke3k3wMMg5+sx7mHzFcV3tM876ItqMjhkRIY0
         bNOw==
X-Gm-Message-State: AOJu0Yy42UHTol3Q+lZJF1A+vlhgDK2G8ExtEYY+Ahei1lUs7hcPd/7i
	JBCs2Q4N2Pxf40sVvegrUvJ22pHLIB/eikl607qgz/y2+I+DhJqWP9hdTmElpRn4S3sK2ioWkp4
	8pT451l6+f5rlwrHJujYTu++aiV59ANnBPEiune7P6UC4chne13A+pO0F4YJF4gthlFjf
X-Gm-Gg: AfdE7ckEMNf7TjujRxGrQy8qcuTWNb8WjnBSN4Zckdew4LJ7EloAtWkEQrOKby5eFzo
	6RFvxW3nKYOEjX/WAiqMSd1gDOs+nMnkR9l0w4JqCspB62tTJHJoxz1dBuJYfjwTplsV9m4q+6O
	GwfGWKzRQ2qL41PCHBiK8+3cxywDeyxnUCCGK5gi4MwH1DOPpyGCWysSt9jDFPsmZPG2eNsefsF
	YozoqN/t6HmDnCHsb81Rxw4cewV0t8tI8G6CnR0PeN+E5Jex9lElP0ya6csV6O8QH5H6wO47yIg
	ZgtDFAHUQ0YnQ8P1f22tbqEdWjM/FjxNbhG/ym1QvvLePRx4ObrqBg4sy0xApTYpOdX9arQSmPO
	E3FzYp+6h9R/2YlZOykQlnPDCAl1XfNzHY0E=
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr82624971cf.9.1783331358283;
        Mon, 06 Jul 2026 02:49:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr82624721cf.9.1783331357658;
        Mon, 06 Jul 2026 02:49:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b60575c4sm711556466b.9.2026.07.06.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:49:16 -0700 (PDT)
Message-ID: <0c6fde07-990a-4c0d-b1f4-34cc61d905a5@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:49:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: shikra: Add LPM stats support for
 subsystems
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260703-shikra_stats-v1-0-0aa0ec1fa83e@oss.qualcomm.com>
 <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra_stats-v1-3-0aa0ec1fa83e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1ZiBiLgx-Q8tzb8SadNPlVzLQfWel3Cl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX5uvtf73QJGkj
 NH9OUGAKCtR2V4u3wsG7qbBs/cXIV8mdlu1xYMvHAbaaqMlpfr3ZKOe1rX/AMqQoKNXlFJysDUZ
 OJ+wR3ChrIlCZgelw+TvjSzYLseR2T+CtEQxq+XtDUj+VpL53nSCTkkBbyynhVEDVzSpFSVg1cA
 Zgs2hytMlBWmKJ4ZHl4TK9v0ZLCXZ0juljjYNothh4X3FZ7bgxKWFo5Bw+IRvq9fSMc+w6R6BT/
 OsYXftOlJp/AkSfhTopq4rxkDauYUUjZOuhWgQH8VCMWpzMpEr4K5n1KSqpiVw09kcQzFFhZzDI
 GxNNv1YfDXhcF9GomIQT8pl9DZQolb0v2etbF++Rlq/7e8xJoxsnPhMBSUzVLd5YlTHz2QRKdNU
 bvawgiFbtiwVt9dnn9AaUkLL1MSnYsHdZVwbcQSQQIjCat4je66h35LgXtAx60WqpPDO6lB09ci
 fK1zxo8HW4KnXVo165A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5OSBTYWx0ZWRfX+QrAACK+KGr5
 DOB2ABlPiDVZSn9sIYt8DiJp418uA61UBWiOqP6hLgcUr9ck7LCwvP+qFtZBSvV0io098jx8E72
 GF6l7Uzc/Uw4BGhrq/CcTV1kqQQysyI=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b7a1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=3eTVZtSe1k2HwHUlSsIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1ZiBiLgx-Q8tzb8SadNPlVzLQfWel3Cl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060099
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116737-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkshah@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E5ED70EE77

On 7/3/26 1:13 PM, Sneh Mankad wrote:
> Add support to display subsystem level LPM stats for shikra.

Explain the problem and why you're changing the compatible.

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Konrad

