Return-Path: <linux-arm-msm+bounces-108675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLu6D9qIDWrBygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:11:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2CF58B732
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 950EF306C597
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7563D3480;
	Wed, 20 May 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvtHNRb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KBfUtjrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89983D093F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271533; cv=none; b=NinN5vIw2ou9cGnkttOEKCxo8FrPAKvAkvdnmyLZ3O8dGnMrFp98zurHR1h1jPsYHM7vTQqxa4HpKnHY/zDA0aQiGyEBytjlyvaVdj0OvMJZ4lcyb9fVzXj4TPnG00vHsHtyJtOYcFqoINapRNcU2QBYmBd1a0Xwv0jhsdGi8zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271533; c=relaxed/simple;
	bh=ISTb9VzGs8Xj0MPzhjKw1URcNpCQEcUmGujhOYHMfpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=twhN+sKr1oDx93jCW1HPUHbM5p2hce69h1M4m4+pPEgkwf3DfsFW3rAMTwCzcQ8QvWMjS5qozEDbHJ1utrj8FmKAqIRCqcvWu+A8b6dHhbhsM4lw9o6uiBp3XJf2rXxC6v/J00K6JB3YQEpgLyP7IKPGSzDaO5SqPs6L2yPXPz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvtHNRb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KBfUtjrQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7DJfi1953936
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=; b=NvtHNRb73nhfYxj7
	k4XZu93/c+/qCDR7IHpVI994MxMZwIs/E7QM9kgoPC+ka2IROsP3LKPw2WrPRDp2
	Hbk8fgxcylTpE80npM9gLlTKJGyDMXt1cBj/OnERk6jatkZ8JxSicmHlh4aoylVl
	AeLO/8wL3yUge4pmjuD3vP1uroQPNZNESlIwEdrHmgLG8CQvzLwQysH1QYtzXRd0
	eXh3EaVySrITj3EsHBsw/K7c7CJLbusgMspqB3riVe2JsYmDvAh7KFOR8E9QjR8s
	qRpOgRhi4uYqlX8vd+kewolN20T4MhjWa1FEniQJ+uQNX49xqGzIFWmY5ucebOID
	G58hkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3xv78e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:05:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90fef17f6f5so119659785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271530; x=1779876330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=;
        b=KBfUtjrQ//cthgr5Ol3eooo2igKpRaCL0oANdLDJvb1hAQjrnrze5fRMOe72KvikOF
         sna+UWnfVZDEGUOWx8AaREhNaSRmABBcWTVFDonSWUCNaBynfzk+NCCI6OLaXIbmSw1z
         ZAU3+Kni3FbyEvQv3c8X55EdxXX5nhHJRgtK4Z1QFlV1+WfVdU8sdF6BHBT5vB7RSZHM
         VTQyLELcOWlkO84XhN0ybmiho1n0TVx53mExxKAbJxvLArcJJ7rDhrTl4I4WlManpC9J
         0tjtqRFqfixMsDAZVgEz1XTmp2fslkWxF30aVdGTbdi6F/RuTS+jtOZYF68ymVOtXUdH
         9bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271530; x=1779876330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gvgmRtkRN1GrJ22iwX+5SYvM2eMdT3iReT/7Dc0XCk=;
        b=PEPnoTLoSZ8aiaebranq04WlnSdxlQGoH8ONW4B/3t9fs91F5wOyBBW3k5fsODW1uU
         2dcI0nypZXHjbEHyHYbnZ3nYk9EuwI8qRI9Bw60S/3fN17YvIAf7P+duNdk55DV6oJjf
         /PqrbeL2kZEtplXwB+2dzuulywNWoUI+RhbHjy/qa6sjUrFXBLsep3tr+2cxydGutQvp
         XZHIqRhwWeb8LkhP/NRvbz3CFv7gvmAKxAPKsX9hKYq0/1dio0aZ7bBMsXIfwl35GGx4
         KurPRyRmY88bY97debjCTXCxDbFdn0Jsy1886JzScQ+KAGUIm7QQtMV8mdWMrr+T4nUY
         VD2Q==
X-Gm-Message-State: AOJu0YyMUtKNbBa+LAXOQuTYMv1ZE1SuhQDJyDl8VMsR8MnQpL7i8+1Q
	hVSGf5uFeHKzU5wMSr6gjJzjlGpvWbB5FZAMO/1U69qUSmDR/pOj7b1D0ZGVAMAhS0NAxPRFSAV
	NQYWdXcMzhSgTmOB4kGktfhfUpwhN3BxAn7Tp4PqJZ2Q2wVnv/rsPAn0oVpxbo5ThIujN
X-Gm-Gg: Acq92OEm7dNbIYiFHCjyqVMM1CT82vSS+kYvsG5H7YltcwTnYx4wnBjaq8x8wr3H3Ik
	DEeLulkrtWMFOUZZMqE2snC228NS4y+9bQltx0oNvlDOBaZbChhEvn61MrAWj4BoAmWHvg0UDaF
	5inhD/uLkU0QU3Wk4w5Z5VTMU8vVoMCaBxC7MGRTm+QI3/EgHH0zUY/13OZo6HiPJit6l/jtbaN
	bwpyZ21ZR4T+hEnAr/BVGxbmknm9snstEego1g1ALDaaoFJmA1jImb5AK8p3q9XfpDUCI5tLkpN
	Av6imJ4QNJoi1uEm5V4wamBZW7uvFjDUOO5s9uU4G9Wxw1surd0hzis1a/ya0VXmblyqkJT074T
	npB5mn6eTYLyjFOfRkWsKNpPghqTCTf8hcz7OilQ/8DFlMNJ9SaWuekewU2gefnCFzxRn48Y4zP
	FgR7o=
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr2206633385a.8.1779271530276;
        Wed, 20 May 2026 03:05:30 -0700 (PDT)
X-Received: by 2002:a05:620a:690d:b0:8f3:5b1d:ed86 with SMTP id af79cd13be357-911d1c00cccmr2206630085a.8.1779271529705;
        Wed, 20 May 2026 03:05:29 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4ded942sm834773466b.36.2026.05.20.03.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 03:05:29 -0700 (PDT)
Message-ID: <b8784516-fa22-4602-93d8-9c5e4e255414@oss.qualcomm.com>
Date: Wed, 20 May 2026 12:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] dt-bindings: arm: qcom-soc: Improve validation of
 expected SoC naming
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-dt-bindings-qcom-soc-naming-v1-0-005d29d261ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WaY8rUhX c=1 sm=1 tr=0 ts=6a0d876b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ZPYqqAgv-PGnnvAlRyEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Aj77HgZ1XuvIr8XxrtjgN_mqzI_o-gqS
X-Proofpoint-ORIG-GUID: Aj77HgZ1XuvIr8XxrtjgN_mqzI_o-gqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfXxzfDLEwmoc2V
 HhI8SceuWlxfrfaZw1LCDS/b4xk8vucp6yLnO+Z6MY0nHg1aRzT56tGTNbg/nSY9g+VhvfM5Jd/
 kAROIxzhOcQWTtI9CbpJC0rgUKn1nQl4XVCf2lwklJCWcp+m9OK0nQS1opYe60tZ7xjaPU2GqxW
 Xyc7WHUa2zpzgs5SfN6YhjQpBXIeTh2/ImQbwSw/0W0Ix847zB8PJMNPmLeXgYv+Mu4u934zmlp
 MxWIpTnGNGyM+ocJjwjBU803E8v/a9DGmpX1LOe2EflA7mqvcQHF+7kkuvc9HUXtjMmmhhd7SCW
 fM44wDG95dw0faucDeVW5DpFAL3B1SJXdkpPJTsa+eytBBLLdsk011HO75QhS9uW61ni0+1fEmQ
 zdAatiqMeTfxOxl+wQn4kX1nRxM4Bbc4M9WEN5YkqQowLfjT09Q23JNywI1Qk3SO9uyoaItx1Ao
 Nfafdt1q2FOn6bjckQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108675-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AE2CF58B732
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 10:03 PM, Krzysztof Kozlowski wrote:
> The schema checking for expected naming patterns for SoC IP block nodes
> was really incomplete and was checking only nodes with single
> compatible.  Improve that because questions about expected compatibles
> still appear, e.g. we have
> Documentation/devicetree/bindings/pci/qcom,pcie-x1e80100.yaml with:
> 
> - qcom,pcie-x1e80100 (expected old legacy style)
> - qcom,glymur-pcie (change to new style, ok fine, let's switch to new
>   style... but...)
> 
> I am afraid that a new SoC will revert that back to old style, e.g.:
> qcom,pcie-whatever-new-soc
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (3):
>       dt-bindings: arm: qcoms-c: Include Eliza, Kaanapali and others in SoC names
			      ^^^ typo

Konrad

