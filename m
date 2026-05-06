Return-Path: <linux-arm-msm+bounces-106087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLKTDNMH+2mbVQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:20:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8F4D8853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 11:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CA87304856A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 09:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746BB36405E;
	Wed,  6 May 2026 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLLzx4Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhjGxZg7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB2025F98B
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059007; cv=none; b=DJdZYjFn/j/GFIMBK/cEOxNb5tEJUpsbHkKjFMq0Umo7oMW5fUqB4mTbAuxh7zc6piMljXiOLM1zkZXxjJ9PU7077m3J0vhvlriOxBldPWktWBvVhlt66qEKrnxf7NzHI+G4W/FJmtHswONlCnlq7irbvxxRE/5hAF3nmnVTB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059007; c=relaxed/simple;
	bh=TxvTfFjdfnWw22HuuKIr2gOK1ckKyCbWP3NkBT75F6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE3TBXXQy/ix+wQdSEB3V3Y36E0+zg70Dwj1fr7M1JIol9aeZDHyYN+uSxhjF0h2L8f9DauEDl6yK+g3qO63fElBVc0iDMv8gNuW8S82/OU7Dv/cfmVrPiwFO2vy8gG9NCt6PITD8dc82MUnGgRqKTFe6ktObAQblMdHlEBvQ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLLzx4Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhjGxZg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6468ZwZ0443144
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=; b=JLLzx4PnW6pOrvFR
	nhE3BxVN/vnR5FjtQzI5gQmMFt2zWL1FxaIapcex5nnLc0hPIgXwDlB4R4B4HZCZ
	/Bf+JBWCVpxsdZFmvenMz+DeFFFg2rdwX8/BLVbbHnLQF4FEpr67DRLPqz2DThJc
	+Y183fBUwQ3m8kLh7q5a6yRBICo1O2ZNjLzF7Wp3uS0y4rT9RsjKP4LfrAhvXouj
	jn5B1xkGwiYpRiTxizuCr1B3Mka6mtnQPVHitWAfgtaOJABgy3hcpI9ULp/jMCR4
	4KN7w1yw3vMKbCA60RarKwolQvtRKcvmigM1u6Es8sQadAIGVgYdDtnVVTd5CGzP
	V2FEpw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0299g5rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:16:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9f1bccd7so16600971cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059004; x=1778663804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=YhjGxZg7sugr+u34uu0nMShBNbdyc6hcp+z/TLip6hMjuC1j9zWLGyHoI9M3I9L/z+
         G+qpNEw7bRvXFiEw/9AlyNVu9/5LlAP8qRd78sh9D8zHU3KBEkCO8BNp/0ekC7cYBJzs
         0e5/MTly2IdseNXZUGIbPmGZ0xolmMO00HqR7h+Mewl0Oc/8NsThDE7GSqIzz05xoybJ
         /lA2vWgwSrFQPJEuHf1NMQeDQC1X8q1LuoUfsdtiCCvrAG1HgJ6GLM6Kj6Kx+l4wEX+B
         A6x84sRA6IexQENkCqwN/lx0b8QsIuJLIYXTB/hjgUJIWyP8lhzlD37RpY6RGT8W2Hmo
         zhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059004; x=1778663804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=lhP1nt+l+JbFj5ml7R2AUuR+MKY/0BtqS1mlsBScVSJeSLHWvuThtesvLKOp71tCSZ
         bnbTGlQ1t7GGO5jKVEMTjiOjO+r6Hhe/rEvbcoF5WME/5ycliEW1bRNBWTpEfjkmA5Zf
         DIM1eia1tCjjwewTS85jIUsi0VgkNv1ArNBuQEEtf63dQgCSVY8QiJu1gya8vQ5glNE8
         n/V3uMdh/6OjNJs4In8wQJmbo9utwqcJJ78DLF3hqaSDhCVP2vE47RHhAio/arksgFFW
         hsbO8ThJeW/LLrZQfJuJCZ1fjVoHk+sjQw1nEZ+k+QrhxigYdQi6f5aMwdfbaZY/I5GZ
         4k4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8T+8hiOYSvALddFyN29AyXZMQaVuedrO3aXzpCGDOGyWwqELE6dyzQXtBQjF6BbtQ5gh9csHve1OzvIEYX@vger.kernel.org
X-Gm-Message-State: AOJu0YxRivEV+kNEszIIb4p1M8WoCWqofhJAb8B7SQEq9nCop5cLqDpV
	1Cocr89zAQ6t0/wJY/LWxAsYUI8UvFcp5UGEriHlS1VDLhNyZmBTOXCsPYV/FeYNdT4nBgFzv1V
	ZUtDLmqYsmaenjBpyLrMBoepipHPiJu27HpQFf9E/158rWHQDQSwoJz2AqRgnK3OPOmIebmrQii
	/I
X-Gm-Gg: AeBDievDDHLjOjhd5uibwfPt5q5+kcO0ZbBobYYkyxdTHkUWhHxs6gMA8+URlPESGrL
	NplmkqcMWEvhy+8Fjha17fGmRr74A4SnizyzZTcvEAXwUpqffB2w4tNDYEDlRdXx23RAQq54eJc
	xkRK5Q94CbVwId/xk0LF7gM3hotdc0nQW7joSaYceKq9aWHvZ34k3/Ko4sMH+pS2tBV7u5YI0UY
	CUxGRGpb69Jwre7mBZg4x91JBtPoyV3xL8mUDP/i7EJbf4jb203Gide75pWD8fofuYVO4zCkK4g
	BwpgC6I5Wv2EmIP4j+Qy9b20JJBoFKS3ccoguy5sbQEVdUJWZxkRKOyK2OJEbQJ+KSF2G0ep68b
	wkGCXMLnvTN+Iu5MMTb7tHXILMFGd9FjaDs5GZ8x2LxCXPdjyKept76bvAA2S84loDM34KSPNO/
	IkMgd2ecZySzv4Mw==
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148431cf.5.1778059004358;
        Wed, 06 May 2026 02:16:44 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148091cf.5.1778059003960;
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd90e1aa3sm1048006a12.2.2026.05.06.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Message-ID: <feda9202-cded-4025-a5fa-36dda8f23dce@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add PIL info region
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fMMJG5ae c=1 sm=1 tr=0 ts=69fb06fc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=cK09vydtsKC2F0QeqMEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 9Y51515rLQLdODPhKwvLc-Zqr7-LsEjt
X-Proofpoint-GUID: 9Y51515rLQLdODPhKwvLc-Zqr7-LsEjt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX5wndbwzhwg4o
 hpTuKzTVz3i+7cb58sEXLZ67ZgLCkb82KKgzEs+k9juvWpt4RCQpE4C9HwA9e2QHzSVKYacn+1Q
 qwtm/ALFTmfMbFEGMtnDXHdXGmxZl59PMlM+AJiDQ1Y2erCq4daA9M89JORCZcNlcCcePDtgZ2J
 0i74vn6xL2CqRdAddQBAXH+0GVn1MCUoY4XPK/e9MpjoKHXuAN4djvk8nrbuQ2VEO/Atlf4cobX
 qeW/fEoV30HQtLpQwEyBBjfp2ca+XWxx7zu0xyq2gA7s9mbeq1oLdkTjD8hIcvKXUc1T3ltLLtb
 akFo/g4CMZICdJBfoLeFV30a/CLG3t1MBX3E1aYzJbjpGenP7s9iELXIKFu9daAdSAId0h/X8F3
 s+fWBaM3WIZCUre/syVWsSH4sEogHLNKBuIbzlmSvVS6wa+kjJzOqEOvt0xk3ltOs3sZ25MWVUl
 rY3gfnsRNETRyrzmT+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060090
X-Rspamd-Queue-Id: 81A8F4D8853
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106087-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email];
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

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Define the PIL relocation info region, so that post mortem tools will be
> able to locate the loaded remoteprocs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


