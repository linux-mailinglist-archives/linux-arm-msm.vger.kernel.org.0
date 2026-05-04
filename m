Return-Path: <linux-arm-msm+bounces-105659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id juwAOoFT+GlUtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C214B9DEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:06:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0827C3036380
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B42314D05;
	Mon,  4 May 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmBwkzUK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cdbyq207"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE5E3115BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881721; cv=none; b=aiqiLfVgsXvvEbmyeIJep3VCzmw8LgubQNpbyO/AdnAKsf9thJxKI347FsVMiIc3VfF9zUEtxmurvBrKqoh5oewCTj6K0R1NCyjI9rt7tOAMvAmbwUmqkakm/IdmK/wUv9WnYndBvCQ8uCuZcasOQvvQFegeeXq+RdpM0dKPAdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881721; c=relaxed/simple;
	bh=SHvxN1FAQ67hKKAgXjoPnPc0lbu1oNAtVHKEqJqvHao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQrnPDJmuN/KbbldrIUH8TanJoUZ7eV0XRVprTo93vaj890b+/7fiIpZpuq4pLxzoN270b97dbRpt0ZPKL3jOXYZZ5Tmn8sqEkoIgwWpCNTq0RYJOzuW2UwAn1mBj8sVOfCdR3KNQxoFDHntMorEEV6z8ITQRJDjUHlCTsdUmQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmBwkzUK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cdbyq207; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCDS3470400
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=; b=bmBwkzUKjTgPASNK
	ARMiNNDaQOvNIDuniIYZzQB9jnNrxyqWEDiSkUwNYhX4+WY5VNowDqyww9Kl6+Hz
	uCkiXFLFki//7MAkSUOGMkQG4/xGN0RwTA2wxLcKSMxQKsi6lJY69h8zhgfmId3l
	Q8VLald/4r/2j/e3rLyhg+QoRbm3RIWVnID9oIPsMYqzaOv8kzb7Y1Q5HitWGE7m
	cXDjE1FzpKtQVlHFp9gksK3cWca3y7kyNVtbWX2+hQ/vexUumd0SXB0ckZCBmLJe
	TxL6YuWrDBfSKf6ffahQCU1Z8l7RFOntovkCQ1pxY89A9jIouBMrFoJonrFCNgxF
	pton5g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9bvmsxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:01:58 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9568c79b893so268736241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777881718; x=1778486518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=;
        b=Cdbyq207kj3su53YrYGmDCnMmPpEOiIAxxHwHnFBDDF24uvYZLQR6i4JAXxyvjPE6l
         r8uDTnDiIk4SE/uE1j0BdyVKdIXL76kCrPRMWyAqXUs4TyC+fZ34IEInLA00OlflwuLL
         oNQShkdMB/QedlzQoDJDBYket3BzICASSRjiN86WSAvS69LOlB/r0j1ljCkPUmIAWZua
         s0hF0U6/cMGouF6Zuu0SbkPwJuob2n4WYqI9Nf5Z0CQqJw9AxEf+oJ6BL/QB3d5RK/MC
         LIMrJXCt3LbHfenlxWurg6+SUZs6XU2ESahCWpB+ko9kE/PQxHNwpCr3MvOKxKw2S6rU
         WnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881718; x=1778486518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEtWraP6YaM2azxEPO5mvuryly/qQzGWm+7OWC4MCv4=;
        b=mvggu+U2V4GTUAXPjKmfkvPwtdvcGYaVgXOFThp0vevpxBc8A1cFTMTRzCAtj6MrqY
         wVqOq9hJOcmvbileP8JeFXxnMNFy0UHb1dX5janKWIV9qJ5tQdvdAp0LmAR67KKib6rd
         lqCQhi6rI/ezFKs2S5z0UyEEnelzBGyHI0RNyiHReXib8aS+MFDA79sDb9P4le8GKOcI
         002/Buq0hPi0orDhYAU/qlE/KdgZPpeev4LDSvrGdDsT4aU9+PBWuQD1o+jPRG9fXi35
         9cLk4a2bUdGmtM7+AHnzM8Yd4r+uaPlNNSfR4oC0AV5eNzUl9tH0RAS91xGIsd0mbB2M
         rWmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ay/bzp+u/Z8C4msBTbJvl7jUKM/HT++w1i9m171+uqqOSr6oICGhsXERckqh+e8UuDp2C8VP0wRLp2Ya8@vger.kernel.org
X-Gm-Message-State: AOJu0YygqHEdxjlzhqFLGws3RIvdBkJX5yF2kA8SmczwCVV27+/v49/t
	NcEUENQnzj+QWSDs/I2ZpulNsZGwrnQmDPFXGWMIPBmUxAGHNJWcJmXjsYlj/ck4yMuN+CKUtcg
	acj1mh0gY1yEl63MsDB4Rq8b4jGrsspV58X5HNJdYEJo5II3cOCxz9J5N7wLH7Uwl8dPq
X-Gm-Gg: AeBDievDJBTqlWng/dNCNjReBBz8XNDaiN/3tCRb+b0PZ5Nedr7jLiGohs10tw/77ds
	ERcPnGLzagyatOC/uaAVQEaZPDe8iBga3wBBIY5nOR/niphCE3rzq0yReJRpZStxa9YscpfCM3f
	KTUPewf6mDE5FHy1f2J9c0ypQr+SR9MATqcoenk5bFIUr+S6YNe2T7hzISRE9H9U5muWm6/XakQ
	11rdPcIZ8+ZWpkl0nblk6C6h0kPJsxR3udCNffCON5vY6OR5Cc2Qk4WDHhm7bd6T0rte1hI7A6/
	ekM3FNx8s1WSAqTGWd2uqkESMDA7oX0+PiQ2ri/qN/lDrp3f/XQoddQvwHsO/wz7pOcgcL4tEwW
	IgBWOBV2sYmCSfWzKJXHXcxe/jy9L7qCbVu6sLJvdm9231LomEQZXc0R4v2y/Qy4N6JC4QktWVl
	X7LoPR2IaWlR4JKw==
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr476234e0c.1.1777881718143;
        Mon, 04 May 2026 01:01:58 -0700 (PDT)
X-Received: by 2002:ac5:cdb6:0:b0:575:24c1:f668 with SMTP id 71dfb90a1353d-57524c21934mr476226e0c.1.1777881717760;
        Mon, 04 May 2026 01:01:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bbe6d06e417sm367209666b.33.2026.05.04.01.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:01:56 -0700 (PDT)
Message-ID: <670bc922-0a50-4f60-8be1-9fadf757b76f@oss.qualcomm.com>
Date: Mon, 4 May 2026 10:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to
 camcc
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
 <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ilfronmuUd4jahR6rSVUjbfUocWXRhXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4NiBTYWx0ZWRfX+ICDKs6nDrc3
 nm4GHkAl3oZzqlXX7CZT868tMUZbkIoBXGqs+Jl0mSNJ2NkklTsUsqrT1zHZxuCd93yFyfzUK5E
 rEgPUptae4hjJO9LbQaeDoBLJSyHwQI+Yo76R4eN/dg99wcsX2rdCOwOHwgVeOVku7yua7gnn7m
 47aWq6GgwUxwYBbzcAjwqRp3j7AB6N90HW0mSoZ/GAczeKu1RwUg6/Z8NhEOT3HUFGLRejLgyYj
 3eGK84dZ04pxL4Jl9eHP17oTo5YcGqbkaovMkqLYwtETL9JroKErSlwPYVdXuAL9gzDCCYGJuVr
 jFEYF7MuLNF087yhFggGyucGHXPfcWEfFGRHeuizYGYDkqH0loYTCZs4cD9wajwslAePGr6Xr1F
 pU+Mu1kFdNrjGArLt1nLDzRGNDWeHchtCdCO7ZAmPsBW14Qa6ggpg6vKIWwuZX6JkYgivWLB6uP
 mMywiYO7xOILGyqwJMg==
X-Authority-Analysis: v=2.4 cv=dqLrzVg4 c=1 sm=1 tr=0 ts=69f85276 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=jeBussX95TUAqHeP4CEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ilfronmuUd4jahR6rSVUjbfUocWXRhXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040086
X-Rspamd-Queue-Id: 70C214B9DEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105659-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/1/26 11:18 AM, Luca Weiss wrote:
> The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
> enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.
> 
> Add the interconnect path so that this requirement can be satisfied by
> the kernel.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

