Return-Path: <linux-arm-msm+bounces-96994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGtnK55tsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:26:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08F2647CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B639C322344B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438C331E838;
	Wed, 11 Mar 2026 13:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bacGXNJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSQ5OkQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDE31B803
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773235258; cv=none; b=G8V9HQqztOV77oJmezrPnwBStpZSkKz/p25fggVrSGVlE2AKIPbHwofYOwhBmo621f+VEmwQsJ8lxqVWr5tfQpbbYk/nIcwV5BbX9ghAYaoFtknywgws78sJfudGwTT2hWqtWDQeKnzaDL9SR3SNDH6+Kk+0IvOjEDNEungtS8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773235258; c=relaxed/simple;
	bh=5YugjOz+HdRUy2XsP9iwWKjQohlRwLKjRkcJ36Mijmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwEBX7kvgCtY1kiZTZrOjOOQQVEnDeokkKZVj50Gn9tlIvTjUxIyq7wpYLQXez1Y3+FB1P63F/sERdjIDeQyPlT4SX+Xj+AItDkdo48UnUt0xLUISAPGWK8ckMU3kEwvJf5TIJ3LzVrJwI9Y0U6X1+Zcc/RHzVLTEC9t7hgiC1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bacGXNJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSQ5OkQf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B91ncq1573310
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X/KpjEcjrBSw229vMgSWlfoi2t/w3dtq/Ha3mvvsA28=; b=bacGXNJW1ywveYjp
	jk1s1D5yfUr8PZI2mWitOay2EcLKM7ErGNgsZsbQl5eiUFy8AW37+eohQFBlTRn9
	6M33OQ8bATpPfBgqkTwVmfRG+qQzus7A6HYuyenk/Ro8CxfaGfLdJhqXnOaCfb6Z
	je8xLjWVtjQSdRA70WmptQzETm7WllIpXak8zxX8KfC0k6AQcGuHUOgBev8KCBRL
	71cxu9ZBxU8GAUMrr+UoZ9E6Vyf0sWpvWnGb9jjkuw0wOro+kK7HvqdMOwVBU+dJ
	GWlbKAgIWfajucoUmMk37ozWDb/FyyM0K4Og+o6Zzc8QEaUGMCI4TxHASH970QDn
	YWBrzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbqyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:20:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a2c535eso91423985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773235255; x=1773840055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/KpjEcjrBSw229vMgSWlfoi2t/w3dtq/Ha3mvvsA28=;
        b=KSQ5OkQf1+PdIUVyIAueVqzlr9qWNFvq1FNbfhicEYv7RtiZ/g0t3vuBH2wyYA+tK1
         CnIOUgcdQ20tBfKXHVo15H06zeGmNTT304fjCH4rLSAlNWfhG9X+UIN+PIr1QvoKnpwx
         P83KmeMUJdO8R9bNA8yNyhZcaRTGDhS1cQ6NzdfGe3pnhMhyC9/K9MQ8YwzR/8OjCZJa
         AELOb6qybUNPrOuZ+kUPj24LfWWCJiyFKienb8qdeBoRqCuh2IlVwFAWD7+vqTaapPaS
         CkRtfK/l+cEemehuJxaxYe4/D+cuFeElwk3NtkDStSkj3D2RdvnYCt1QOkSIlnaUmNNe
         7uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773235255; x=1773840055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/KpjEcjrBSw229vMgSWlfoi2t/w3dtq/Ha3mvvsA28=;
        b=JPCB3H5oEAMJil+A3WhsZ+rOQ1M1VetvH1SyHFcdHDAc4xlWubfLUgHhbNduKQVnky
         jt5qxnDml87BRqk3PJCPvW2BWxOInXKl97JQZ400HiRZW0edq1rfbe9RAw19YJkuvLJU
         b2BMI6Doeq7JWYX4BrrfbBD0BHgxsQuhSBQoSdnh2reBr+lZVCXPGxDZYF6pFWVWW+oS
         JwD4v5er2uvlLkbS+fYFnqVjNXWsXrLI2u4nnL7xWwqhu7I5RZbaVOQZ2ZFYegdGyywo
         T0z4UVbCWt+ckr336Y+e4pRCgtuZNUcuGz+QPfOLu7Jufv4zR6H+wJFmUC4cQEXnS3Ds
         /xCA==
X-Forwarded-Encrypted: i=1; AJvYcCXA6gvkT5C5xXaDGJ6ATanxJMGpIw0SAOXTMLgKzcO0eUBpG/knGyOor17lpds3CC+wpcekX805cfp1qEBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2lCS/gCxrY9mOEDPTFz8ckj96sbVXPrp2TFVqRGEtK6pmUcP
	v2uXIZNsHzeX9faYibLxVz+PVbkZTfFoqp3JDmy/7Zi4Cro0KaszDkCDwHrgUFvO/eQrY3dAG6q
	YJF7LN2n6mVhV3AA927V7Ve3oHoQVSfiz7wko/Dht4gXTEgcWb4sQmdXbWmeKzUZMukFH
X-Gm-Gg: ATEYQzxOmUnEqwECXvCNbI8BYRgLQDoEaj6I0cFGAOSGP1ZxOz3S4UZjZu7DK7+MDkz
	Ay8h6FXSUvK8qgrenYkhQ/8gbZNvoiHfK4/xXaiTmWKBy1iXkIj49fbHLKLCQJ47OaahTvBHt/V
	Offckoe/oF78aKklGmgFazIr/IKEnEa9hae08bjgNLz1iqsX9/nsRt2khHphynxmsL6ke55IsTa
	/Fm4RYxMLna4PqvBZRCMxnic9nQYjPwvO8179BRhUN8DysXj+gBLARshSW6PAMgztfEWATaGv8h
	tABNkxX6+9gUWMs0AghHrCW7xeJlVS1TsqA98zshGVd/lREuMVkldVuXcohuQKEeT0QHE2HGHAV
	kOE4ZJuaF1E95CYg4VIJ+HL5xbK1NfSZ6MAlgr03hX02d2R0LYEAjZBbb1dHWzVnf+L432gay6e
	rY/n4=
X-Received: by 2002:a05:620a:45a2:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cda194a812mr270676785a.3.1773235254946;
        Wed, 11 Mar 2026 06:20:54 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cda194a812mr270672385a.3.1773235254510;
        Wed, 11 Mar 2026 06:20:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-663144821adsm524831a12.8.2026.03.11.06.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:20:53 -0700 (PDT)
Message-ID: <2511dcdb-12f9-4946-aff3-4dd19d8d9348@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:20:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] Fix up WCN6855 RFA power supply name
To: Konrad Dybcio <konradybcio@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 94N4yO0vwGLi72-dTjIC1dJ9cXkkw-pe
X-Proofpoint-ORIG-GUID: 94N4yO0vwGLi72-dTjIC1dJ9cXkkw-pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExMiBTYWx0ZWRfXw5vz80YaCVXC
 2STUd9Ls7mfVg9/RQyLDCm+vLnVlin6CkD9QkC+zXfd5+Tz5wey05OaRr30B9SqCtNuv6HdjRwa
 1HaXfgNwbxyvYm/nSvnXJSr2ouSZKcX0BO9fI0ZFiOV0DzmxoKthK8+pKHpqPScx+SNhaxxxBNf
 3ug6i+LBj0TAH/dhgk25XITETdAxz5TOUMKF+jkhjdrItulQYnfX9328D/8mTM4XDSBXNmDJbVn
 Ciq2JM0b5nil6qpoAo3MCAtOs/iEsSmkW6J7YUjFbEQN3QLwgVy07pJCo9ISWgHOGTKRKCBxOcO
 ugtWDzwQoK8D4LAjKMoXa6L5xhqhNXwV3lwWF3/VwECWlrLTw8j2kmcthLRdMVmhRjNOjuk03K1
 nmLIWr8WBvTECWPcDOVBpuZuNP2XEhfHcOkCSzhC6jyTEQIqEvCIcsGg7u/+E2DaXxrHbYyHXdI
 V908lAjtLYrEXL+Kkfw==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b16c37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M7h3R06PahCMBt7vG34A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110112
X-Rspamd-Queue-Id: 1B08F2647CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96994-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/25/26 1:23 PM, Konrad Dybcio wrote:
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") renamed the supply representing the
> VDD17_PMU_RFA leg to mention "1p8" instead.
> 
> While the supply's voltage is normally 1.8 V, the bindings should
> reflect the actual naming of the pin. Moreover, almost all DTs define
> the output as 1p7, so that ends up looking a little odd..
> 
> Ultimately, this is a "fake" regulator that is consumed for the sake
> of DT sanity and this series is meant to bring uniformity and squash
> checker errors.
> 
> The last patch fixes up a less-trivial warning.
> sc8280xp-microsoft-arcata is left out because I don't know whether the
> mounting of the chip is on-board or as an M.2-y card (although I would
> guesstimate the prior).
> 
> Depends on the long-ready-for-the-merge series by Krzysztof (per-chip
> bindings split of qualcomm-bluetooth.yaml), mentioned below
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v3:
> - Rebase once more, pick up more tags, it's more than ready to pick up

This series has not really changed since its original posting in
December, could we please get it merged?

Konrad

