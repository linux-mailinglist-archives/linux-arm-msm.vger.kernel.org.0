Return-Path: <linux-arm-msm+bounces-112488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l4a9I2RrKWpLWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:49:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0AC669EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=flc3eyxG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K058INB+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112488-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112488-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE0AB316D3FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C59640E8F7;
	Wed, 10 Jun 2026 13:44:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64240B39D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099070; cv=none; b=KlJlbWZIAvaAudnY5suY1OXhjSsnb2Qi+OFn2NVPyAkk7qD1bUHpcLk65QbAGv9dkrgjvxMTp3b2Dy46IwVkqq2cJ3qYvEWJ9Mv8TKYnQkTIF0EVzxw3+VuEWl27ZlzK/Viyet6w84PksPaVyUnYIokzctcBarEA7y+AAQuLaeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099070; c=relaxed/simple;
	bh=5EPC9P5S7PUBZZYNo1LRAWS0W5Ye46rG956pbwaEauc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbxNRvMH3QeMXvrsPz44llfGrgIsClmGX6IADgAdYiEbM5BVNIvjxs//vj02R+Wg0Hto2nEmPDj8FzXcmd0GY0KOgro8fc03J+cc0AMjuwl2uXGi7UOG6YRGfMPj8R7Eq9bzCvi4FBGn9iHmI3nVpEMcwhS3z620XDvUapToBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=flc3eyxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K058INB+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACCHbt1472577
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=; b=flc3eyxG1ANQxx0E
	PR1jtTzozfOBxIl2e+vC8kscK0wbejwCVVzkoy+bTxoWNKFzPRdCICdLlE+wtglT
	jFFw4TN1zILUEV9T6r0HDI/PuojjMXpQ4hyOQRVokAtier9ZRV/7DECgkxYKpgY2
	zAcsZgVKP3ThhDaJ4FMTHFalBFA+x/X+C3byxM4/QCiYWQJCfqrL7GbeSnRRqgcG
	h/fzSsTLsb+yI1rWljclN1hzsOE6heRCYTQU/vUTTqOhwyKVw/QwvVf2I4MlPYte
	ROW7SfOuWBWanZxqCTgAGYzmkNXphP45YgeIwntVGkotFxMHog0etTvPdiggBH5S
	pjHDeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kda3fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:44:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51780e3ca44so13389151cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781099067; x=1781703867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=K058INB+cWs8xVONQTmXq6ji/Xon3P3G4L6i6Ki0k+4Y4W8gfp/H1CcJuObkKc1Wxr
         E9CR1tiPv913hRkrhS6Fs2MIgAv1fgFBOvtsgwJ9eUQTztL5nLKmxiPWeXZmG4GeJFXz
         YENNxRF35bxGQ/nQbBGhLSbsTu06siNFGrVx/aTQ1VSpGo2jtuIwiH26bYS08lHxG1v/
         CZeBeayhWQmuTj3q0njaFi/6tKgJFY4NXHDPhVEIy9yYe3+U6SVGVQNrUhuXffg0Qj6T
         11n7jCLnAk7mpE/8LLp4LU2dHokhiv9JM+y5MXyUduZaVAe/31ihp13XBOXl39+rrn9C
         rKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099067; x=1781703867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc7H0K1bLjrhuNzodBgwv2B+RcHZws9T1i//7fhlpOk=;
        b=e/RcYV3w3OIMJfhy9HL4ZhP4zSdH3E4gyZS4y+fP3ZAr3xFPJgPetjSXRqK5jPstz0
         Pqr/Lq+Lk3Y5i8tpE/QupbkaWYEM/lOKrQnHOhZV2pcJeuHeI3i1zshsNNdDv7CvWVxN
         pCnVxkkZUiODTnXYS5v939jC7DoefmB648fh0LYjWPY5qN1MVijos2xd+AWDgzTM+e3+
         txPQ2p4JLpeAkPgs2pi6oTNAsc6SiXJMVmouwxLKMAsHI6RGp+pQyZ54HHEMvm+g2jD4
         5EFBr4wfRFi35fto6LgXKyCxI/lT2ykK2un+ctXKCd7AhoCNch6p/OLUGDPh+CulRhLO
         DlxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yvoDKa8aZmanDT5VrzRUQhw9RhsajEYPBzTivbwJlsqJ0FtF1GSaj0Qx1kvIW5Q++IDB187sX++R2y6ws@vger.kernel.org
X-Gm-Message-State: AOJu0YxER5GBlq4QAno/Sr3C6L0NoDBdHbQtH2Op5I6TxpKlIfrIeHhD
	xGMsIEvlnOYICPHpwSOHaB7Wv2o2iL4l8DU8erhkYB+nyVwU2vupYrnMvg5fiwcARIqXXUx2v4O
	mcPg7FYFCGxved4awtiCqaMuSZC9sdb7jP+Et2hshYzJsojrYtBWKZcgiolqg4ueBEbC/
X-Gm-Gg: Acq92OENLy1HEDwcj33ONvVg1g+4ZGq/KUPZxofDuUceT48IVlk9DmCJi6GY0HJ19JK
	kXXWj4hBfXwr5Q+FW889qZsgE9pr+fnb2Dws1s9zVUtbfGyM0sAy/N583xubOag2983cNrokotI
	KOEKxzdO4NWQGhXWEP4TMvdcwxtKfHnbiCG3jXAbCGhWkBvS3n4+a3zQy149SJgbb3rZRtHSzme
	eXwF0pSb4DakYzHSdtFX5zZmuuSzHIXSh62dG//v/p4AiU2nA+GD9bstLpkljgLTVGh27vE1naC
	Ah+w/KjOQfMutCfnkmDHqLUR6vnDzKuvwkHOm5nHHhBFQhJk8FfzTED9Kb83cRTLidzJuV3J0QG
	XH3DW9KmdzCenpj6/4Y2Zeuh9kBymjU6AWwIZpgBpEqElT3FUf+ULe78C
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205452991cf.4.1781099067022;
        Wed, 10 Jun 2026 06:44:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr205452531cf.4.1781099066564;
        Wed, 10 Jun 2026 06:44:26 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9b1fasm1203203666b.23.2026.06.10.06.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:44:25 -0700 (PDT)
Message-ID: <bcf0fa6a-dd47-4c87-bca1-942303ff7a5a@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:44:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] dt-bindings: clock: qcom,gcc-mdm9607: Add missing
 "clocks" property
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-10-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a296a3b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hM3Lp7_hyHUGSlGb_zoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zG9m1ZQVeD6Q7QDZEEvkIXig7gjKZM9z
X-Proofpoint-ORIG-GUID: zG9m1ZQVeD6Q7QDZEEvkIXig7gjKZM9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEzMSBTYWx0ZWRfX2BBxZOREwgd6
 mqwCnyrbBOcnk2jIbGKyazsBpmOb51fn6UK2OYbS4SWtEtUGyApPw6kyBAQJYxMhDnaUINr75w7
 YlMAZf8cvdPa6GQlr3W2EaReal+R2dE6pmT5+TrNYV4Dt5XT6jFMhRQap9wlH6xObLu2h5fE5dA
 YLKkAAIN8u4Pd0G1EQwbugtda75pmBVbQhUQTHmEFXcqXF5yXtjJ7k++JTNBIaH7yCX7VgRTpC5
 p+Z3g+6lww2qs0PHNU90mnONjIBSUx4LDaZ70Cy3RVduDtbIPYSKPdGTtEYltGfG98GebFocWX+
 QN4SRUYzlxZgqyBL/nDwMhY3GEtmWHFnBIZ9+z2GHnHZW/yk0WL+1i6dVJKeWwzd6ZoCoMOSrQF
 AqcRH1Cf/u4O5kPYcSY6QMPdkmLN2KtHvFtU0blLY3tbcQkpBQmdIdGCAX0Gv2zzPt5fmob7htl
 oDdBFSbUsv09IZusIVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112488-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF0AC669EF0

On 6/9/26 4:14 PM, Stephan Gerhold wrote:
> gcc-mdm9607.c uses "fw_name", so it requires specifying the "xo" and
> "sleep_clk" clock source in the device tree. For some reason, this was
> never documented in the dt-bindings. Nowadays, qcom,gcc-mdm9607 has a
> dedicated schema, so we can just add it to the properties without any
> additional conditionals.
> 
> Fixes: 6faa7e4ddce6 ("dt-bindings: clock: Add MDM9607 GCC clock bindings")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

