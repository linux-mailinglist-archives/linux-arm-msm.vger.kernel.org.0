Return-Path: <linux-arm-msm+bounces-93312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGAaFLH4lWlMXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:36:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 776FF158598
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9E3963008094
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2FC33BBD4;
	Wed, 18 Feb 2026 17:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ebyJ+cyu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDw6EuJw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CE72FFDF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771436198; cv=none; b=SxoFsRcqkuVLg/CZyWDBqfxyoxmJ0X3KzcwPL6okV8sRr1wpoAe404jLmHOZ/1ALNkJ3YHefG3B4wZ5oxvuA5KseJ/1KhR6Bt38G2Jhh5U+9uGOPQthdnKqmXDYzLmrq/NTlgKuztaF+TpJR1pftm0iJSkaAS04QaryBtDpLiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771436198; c=relaxed/simple;
	bh=K/xPo6jErXDjS2H6F35+o+2GzhJpN5QOZaOO3Mw6si0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=afqIFUWkprtRoSLnDkKU8cnOXwIJRI9X7GVGT9I7cbykn5gzev3uuE8T8baf7r8RrBktn+15miu9eUhNTRdhaUesH9BCZ+8FQFZjyST/H2Oj2aSI2fnBop0TfTwZ7/fX5rnUTz9/Ph4bIA3EP9xBE5bhy7wgrwQ9IXt35UN1u5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ebyJ+cyu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDw6EuJw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I90bww2784608
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUA9mV8Pw/RXrdZSMzzTtbtHdDf7o9LoUEjvzb8m0xc=; b=ebyJ+cyu0GZe3Jc7
	1F4LM1EtL3A/DC5QPdV9fuV+cstPB8h8WZkLA4haScXVUYuW6p20WuVZmwUkuIwm
	EiUgl6xx4iPLaLG0Fm0NWnNLrjvUe3vr4+PR9U9+xj0vrrkqKX73ZrpjC4SVSYWq
	wv0aEw1JJGU/af5FtB7AZXmgRezOvaviuWhQ0E4ayLb/MXKBaZlfSQ3/Mfd2P8Qu
	AKGbmCoi1kI4TaHpjaVBE9QeeAytWCB5Y7WcmwgOSWsJ+bkEVfMAtmfSvh6x3qd4
	vMurlirFDVSUK4p9QJguvi4r27tB+DU/dSbI90VPZjCoVuk2NIWleSSfcvO+EZE0
	m7lXkQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk30nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:36:36 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6de06e6c08so4850a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771436196; x=1772040996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUA9mV8Pw/RXrdZSMzzTtbtHdDf7o9LoUEjvzb8m0xc=;
        b=SDw6EuJwAR/Srdr4zLfbntjdAt5eFWR+vE8HJcYCQVIYJWPj7Lv6qBNU8JmFXsSBdr
         vX022PM99GUmTd5eaGZwDm30lijijroTslOV47EUTOTOa1YQIniGRBALMWgA24cPyn3M
         NQr3xM8KpGg+NiL7FBE1caRwtg0cHGoVmw6pZ3lPPsXJTO0enmdLUqYjLpfpDTiat2Zf
         XTSs1fdra88dgPffWWm7381EKquTH6LtlfyuDHZSrsXtakI+oZiqVQnNuqRRiBCgZEM+
         32dyiEVU5ygBFBrCON1dJhj1hEUj/ykNm04htBhwGvlvJQhLHLtuOaVMhOQi/us4zRs4
         NsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771436196; x=1772040996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUA9mV8Pw/RXrdZSMzzTtbtHdDf7o9LoUEjvzb8m0xc=;
        b=izO5Rl0GXPGtXwRB5K4481lindA9ks8uyVW35MlZLoCG/cnr4rKNABz4HR2c87eQKy
         g7QI5Z4ttd1CFaa67jIQsiVcKDezVd40n9cnLhQ1YXzDUTiBh3uEKHqrObbXxOGRzliH
         L6gqMSOLqmHl/pnsavw8qNpxm5q49GnaMIJORXbrZSHhKMLo+/9MKsSCZcZ4kBnMxK/g
         96lAu/Z2VrZtKDbly85izMFFz0hhBIUSE087l7enVqFyjid1sdpNBkckPxLyU/4BitTR
         DOsVNU/pOhrfW8vA7SAouWASP1BGL+TFMxywuEmTUBuDv9Den/1rQA/nOOoLlRR7Taa3
         AjKw==
X-Forwarded-Encrypted: i=1; AJvYcCVzwuyX1spNFGoptHmcoOkiw8o9IpugejFTOOyJihQHcF+TY/zxuXmb3KVF4vOlFp7tPe2cZqKbAKJW020C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyay2j45PLjlblpvOl3YyqJKHmHdS2Lgz565Ky7N2N0fCKRWOBy
	GEge26txBjUDGYFb6FUBtDqCC9Gb2YatlxT2s4abJLI4RLY4e7BLy8CAhEH6Z1/9+J3UCbiX/JY
	bqmQYYbix6VuRqXlf87ZHXP1x63dFaUNKz8YRdazRGzUER1uhKWnntXAyjW3JEHjw+QCl
X-Gm-Gg: AZuq6aK34tmlFCqxbF9n10XSacSHxR4AI6rFo4+uTFwAXIPXpsGZ8so2vrKELvP/IsS
	7mLcMrCjdEgcwl4U+nsK0dBGTw7EBzDV3SPoaAWYEkGZtk5IOL8hKu0VUuTXhuBbCi8qp+Th8Jf
	A1xLepaYMdO14JgZ/KXKAZZilQtXtxCnhjPJI/lxgnQuW+UX23EeGYgkcSVTSSPV8JXoDeWLJvM
	1n2c7mUwBf4M9y4RE/+8y4I/143SeILpI4vxBy9I4hfuBr//qTyT6LcLUdLtmdeohMNz/wWNV5R
	+Agq8iH5KKgTru6vCK6LpuCuo+5YTE3vWchZusoH2TdBkcKA8e56AZYPENa+qDrtGdI58JUoi91
	RtKMYGvWV5IfesNidGMy9/5MhxD4KAQW9tOdpwFJDEsPnSb/qdg==
X-Received: by 2002:a05:6a00:8005:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82527489002mr2108299b3a.11.1771436196068;
        Wed, 18 Feb 2026 09:36:36 -0800 (PST)
X-Received: by 2002:a05:6a00:8005:b0:81e:81fb:b392 with SMTP id d2e1a72fcca58-82527489002mr2108277b3a.11.1771436195547;
        Wed, 18 Feb 2026 09:36:35 -0800 (PST)
Received: from [192.168.0.195] ([49.204.28.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a431fesm17953696b3a.20.2026.02.18.09.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 09:36:35 -0800 (PST)
Message-ID: <da3d08c0-b433-4b42-8f7c-fea9288be9bd@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 23:06:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom,glymur-rpmh:
 De-acronymize SoC name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260217130035.281752-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tuu2KflrFmLeCCSBXK4NDhmHdIaDx0dN
X-Proofpoint-ORIG-GUID: tuu2KflrFmLeCCSBXK4NDhmHdIaDx0dN
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=6995f8a4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IXbkkVN8uJs8XsqYossUiQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=qt33lqOf0HS-XDKnBJoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MCBTYWx0ZWRfX4MtzEG6sMNjB
 CPQWWwlKctxZ6cLJNKBbOFrx8zjBF/5RpNbdHqyHyCl65p6INIGJK0zgG7FH2HC5qin17y0iuAN
 3ujazJAzGIEfEnPn+MbHOz7mv2HbLUvNFeClBFtfu7zmWgeNg40Wk4SVF/2IDzZ8K/cnslaLz5w
 /WcBPvuWPOJgWrDFKB1FXTgf2T28x5mIl91WL0it8rN0ggSGjqV0lJbbOGC+pMvNGwBH4VsrgLJ
 jltZ+1njbiAZRX7nqXjwYXmfsllXvjdXM5ABLa5D9KZI17fdmjX8+t+n/A7AdIxZ/1NLe/93IIk
 ruQqAxp4rHGNKfJchWvs6BdGUwpCfqlOAtWCPk1EDI2GNPXAdItbBeTbFskzeOYZsVQB9XtuFId
 Hh/4AiPDXMeomVHAmFaIfhO/eyz8WzD7KtT4njygSkoT7DkPO6/4xORHC4PmhET1Z6VnTrBagBC
 cTnb45h3joANjnwBORg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,devicetree.org:url,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93312-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 776FF158598
X-Rspamd-Action: no action



On 2/17/2026 6:30 PM, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> Split from previous patchset, because I messed up commands and combined
> wrong patches together.
> ---
>  .../devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
> index d55a7bcf5591..65b0ff2b2c85 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,glymur-rpmh.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm RPMh Network-On-Chip Interconnect on GLYMUR
> +title: Qualcomm RPMh Network-On-Chip Interconnect on Glymur SoC
>  
>  maintainers:
>    - Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


