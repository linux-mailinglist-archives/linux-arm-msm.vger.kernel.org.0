Return-Path: <linux-arm-msm+bounces-96591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACeKHB/xr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:23:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCCF2494D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86C573077E6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95CB392C4C;
	Tue, 10 Mar 2026 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7OfdnNp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTfG6zDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA40279907
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138192; cv=none; b=sZaWsIB3lQP3RiVb8D8FLqxifuvQaChUs3UHaBSl6urTPYUSplBvugqN9un0rPpe90lkz3Anns7WxIcN+AgK3zCS/PGt0B0c/8Qb888qePHxu1fKlMEF0JKUR2DwyLHstpLL4vp69dabpcirKWTarUdOPTvd0DbSnbj9hXmPfaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138192; c=relaxed/simple;
	bh=eSqcW/Jg5ZXtDyq4BocbbZAjQ71kRdMdaBuPp2gnW8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrXrNNNarkGsgxyVz3fHpyNhAnRJWHCwyuL2NscFTUIgH/c/Ph2potcgBfu5Ir15GCzSmbd1eo8EEii3t8CkYMEVZyK6CFUAtkMZvnhbZQlYZAV9u/whcb5ASirHp7w50JgKrQLRP2PWB3rfcz52oJywvec8iqrP3vtJe2xQW/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7OfdnNp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTfG6zDC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8paFW3690626
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NY24K/MIJWkUt53EdM714/u
	AFIpW44Smn7AbJecbIQ=; b=J7OfdnNpsh55aRTxbhsMkD3AnqiI4QdZ+Tp/a5n/
	xLPpKxXfCyHbPYNwi6Vk+uhEa0yS+c4qF0nJAsPQWraHMa8LbRbMtB3273e4TM2m
	gBqfWDfCZNCxJCJ9KWjIgPpNkZStnPzDYT++EIagcBq0fCDi7/Dfzc5QVF0SjOCA
	N4dwuIaH9TbKDH2GqSljObyEw2ND4P891EQD9Z/UQ+Tc8hKqiRz6YVmn5eRTnrkJ
	8ZFLZJsJzuObFzZeSjq64lEkamw+im0ocndG1zMFH7cZ27N1ploV5z5vYis1VbaQ
	CrSTddAckICTD/3wESSWOscMuLasV+n9qsm4mDDhO9Z+OQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg5ngc08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:23:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so1307985485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773138190; x=1773742990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1NY24K/MIJWkUt53EdM714/uAFIpW44Smn7AbJecbIQ=;
        b=PTfG6zDC6s4Dr31kg0fTPPUTF28dTm9MnExmFPDYcvqUiLL5GX3mOZOe6HHloZC4MF
         YI4pGn813ab6HX7km6mNkqYQnSznlLilnI2fLkg/1DXdUO0cFnYRq0pngCPrzoe8LrQM
         V6ZyCvUa3F+pKAbLuBTrofMYGwcmdspQQjcaX43gBG15COQgLxCifN31RAZTSg2JqlsW
         1Z3AiuJljHx0KbbEZdTxxl+jbY59pHHNgKNgm9oUKc7r81+VoPXiVTV1BX8OkHEiWxFj
         qTPKFLbExfGn959EmF8uXM8xENwHi9uL682F43gtCuNC1Vrga5PII5aTEODhBNhPl0Y3
         aOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773138190; x=1773742990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NY24K/MIJWkUt53EdM714/uAFIpW44Smn7AbJecbIQ=;
        b=VJPAMn2avdhErOwWjL86QY7AMMLet/A8G87qPmu/5vbuF7w59fCfJBastC7cu5q1N+
         77w7gzGHL+96rLZEYQogB9fPRWK6fPcLKlwXD7S1iilGr6R3SS9IyJfUFrxiPoT5YiEt
         WtVkOA38JFJprMbUSMwiRgMde/FE4PChaLhPwJxtD+E//OG15gBJ7JSjx9MHbD44KPN2
         /FuENRz2prlAfW1Qe0Y/FvJzVmGai+MDl2qBm/fV659xfIdFRHV6D1aZ/amzi6J0gERx
         qgrcDDzun/Jd9b7ysBA1fGhmWZfySzeDk5syDfbajrG695zPWbngoYnEJ8bfEZdjRk/l
         USxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVevas2Z15gwNLFSnyyucXwTn8mLngpssf1wlgGUmbM/YgZc5TNWrBuw36+a9Ny2sieXEpqNdNZNnPiD3hx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ckE0GipBSBsDBHNjXU2pS5rwc9FyLFHob1WFStDy77cOjrsZ
	eVKL9I+oxbZYYktwJqy09QDW5FSiXLbidhvreKqW2l9pkoqEybWpsS4F/BkwsevfsPD8oPrvwb/
	NrpwEjkqtjT1hsvnw1UmBAgwwn3nrAKf4tPQvw9StuhWr4DxnwEbWEL0K/tP2mU9Q6TnX
X-Gm-Gg: ATEYQzw49fO1x0CQQZQOPrMSB2mTcPJKb91OOeaFhwhFYVfwicnswx4ekmF91kmIMdI
	CW5a/x4jUY3VpAPKPB1pu1/vi18P46FUMZnKI5o6cau9+NrKz9MUawi1C4rKvhz8xCJIeg2Ivct
	HHMP06aUwRFQsLSbV6AKYylJ3CfB8KJFGkffo3sLBsmBD8j5G/emlz986rmDCLmdC+IWyLoMFOu
	UwEuzgUHzo0ktvacyaCMjNJV5pD90DAgKVwEerkqs0pSdwITBCwBRQXmyTYsfI2EqO+HuFu+GGk
	TxFGKXid3rMSgZ/sFyHLgOw542aMJYrRIEOTvW+LdqGam5MQIgGzQMdyWv0LxW9C3yUKSa7M3rX
	xJqf4GvtS/QJy3fFdk822YvpfPz6+QqLYma1I
X-Received: by 2002:a05:620a:25d0:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cd6d548a09mr1800612885a.74.1773138189833;
        Tue, 10 Mar 2026 03:23:09 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:8cb:4289:6c3a with SMTP id af79cd13be357-8cd6d548a09mr1800610085a.74.1773138189155;
        Tue, 10 Mar 2026 03:23:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae46353sm40465717f8f.33.2026.03.10.03.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:23:07 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:23:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: document Eliza SCM
 Firmware Interface
Message-ID: <dqgcqu2wcskl7rxpv4gf2ltunopyjd2cpougkljga6ogih5x42@hji7dtp36cvu>
References: <20260223-eliza-bindings-scm-v1-1-c88643112dd4@oss.qualcomm.com>
 <20260223-flawless-shrew-of-skill-efe049@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223-flawless-shrew-of-skill-efe049@quoll>
X-Proofpoint-GUID: IiZpHXKhjClSwAwQdcV2celS0cCaae1M
X-Authority-Analysis: v=2.4 cv=ervSD4pX c=1 sm=1 tr=0 ts=69aff10e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=zLld_iIxUUPrxZvK4H0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IiZpHXKhjClSwAwQdcV2celS0cCaae1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4OSBTYWx0ZWRfX8w7dh3VBUDrm
 k5nBgTZcFEnNkruDm9GkVRo6f+2dqVcJJldmfJW2Ii32f/5TffZCMScS60jO1rWp8GbWznVoioh
 MORLMVeZYzIf62fzjUSA9PwJAqesLfET6g3ER3A2bMQ+Dr8BS8Rl7/dI7WzvCza+T5uzZyhoSbp
 /b3wdsCA3r3PFK8D47GNUC8JnJmWHMkKno82tqz0TEdF7lr8AVmrCz2PBuX58l/lhqlYjo+Yv30
 ar5k4Fi2+45HiqGBHlCJ6CPOHQmqxPFfIb0U0AVIoizom/FheUv+m4ExwikxYkHni62AJfKx5oS
 sTfPRVV8HBD4qu31x4r/KT+0g4OkoWBINGF5RO9mmcc6NRIeK7/gfOnurJh5gYlfle6CjBP0nkk
 NTlgxeuwF2T89qs3FP2Ea3ZZGTQEKx69G5bwlgoY8cPf1tSuvZUQMZwbdm0SSvIuvEfn4mywUSW
 T/MgH3yOPwr7sVKVEtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100089
X-Rspamd-Queue-Id: ECCCF2494D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96591-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-02-23 11:41:31, Krzysztof Kozlowski wrote:
> On Mon, Feb 23, 2026 at 10:42:02AM +0200, Abel Vesa wrote:
> > Document the SCM Firmware Interface on the Eliza SoC.
> 
> So different than sm8750? Then you need to explain, because patch looks
> odd (incomplete). Plus I am pretty sure it fails tests on your DTS. The
> point of the bindings in DT schema is to actually use them...

So as discussed off-list, schema doesn't fail with this patch because
interrupts property isn't marked as required. Not sure if it should or
not.

Anyway, I'll add the Eliza compatible to the if-clause for the interrupts
false, just like sm8750 is and that's it for now. And I think then the
commit message will be good enough as is, no explaining necessary.

Thanks for reviewing!

