Return-Path: <linux-arm-msm+bounces-100721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIzHHhhEymmu7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:36:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83869358477
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56C8E30008A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE4438551C;
	Mon, 30 Mar 2026 09:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DfS1i6es";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8T9jKA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6583AB294
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863232; cv=none; b=cJlgVPbLcfLPsgc3MuvTL3BTEvtEx/IAvoPpBe3mgIRgERsL7htQo3eQalUh2WGEj5RZpm54OheDXDIlt/ayff49TL8ZlvOWKXOvmJcVGtQePCoN1JHEpuf7xe9ByS7b9rAf7T0DzBRigKKFmn0aCpSXl8NNDkY/5Y6QC77ldvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863232; c=relaxed/simple;
	bh=hFrWsIDAOV5krUOT9I2aCEMQtgjmgySJyZIQWoaMAlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HxZDLWEdl1aE/sSHohLt2QMxUn/U7FKw1SelxynKjLTPFrnxz4Fi5mD2OBo2z74KTnpEluhusMDX4IrbMKwe+Gb37N32H049ZB/MTRn9nv16+YbMsSZpCnZYJ7NczGr0zyOnxRkYnwYEqAjs/q7ee02ArSXwatgmld5uhFqotMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DfS1i6es; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8T9jKA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7X3AU1375183
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=; b=DfS1i6essP71EcNQ
	MFbVHtVRMi/vOM0i1pBaGh76CTPTd/J4GabHdzBWwto4a7WUDDjrUysX/ZcJR7eO
	F9QS2+JLQ2MVSkfIPFCCPNTNLHFIsb1Eq5T9qX47LD92yeHA3AYFOhmIRBwJ95p/
	19KcmvEVt1joehZzKx+AoZyWjjcsYRQdVrzhgy2h1DyHhTf98IxWq+td4DPSxwHw
	UTNevnyutRS/P3gDczNct6S6ew687zYqADRddlrU3rSxk3irGgdfH/4Ygryucqtr
	l1gq/MFuq4hWnJb3xy2GRu44FAfOYz2X21GdJbWNErebRJW9NQaTrtPDTIDsguhy
	lA69wQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67715g1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:33:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b9074bd42so14424231cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863229; x=1775468029; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=;
        b=H8T9jKA3wZDvNkesXQJuSlj8lP2Fbp8O8O3GJdbqF60pR55hQ2Q6Epr0fMl/KD6Y93
         2nuk9evPg5MxrjrWpBUVUufrzCfJ6R2/kHhGVcgn9n3ZXmuPaK3qF/fduzj7hTUvIQcS
         lm8OSp4LhoIDpoG/6M+Y7zFHGEtsQAGzy4Nb9HvFdyIPcZF36HiifisVhSXQBuL3M9al
         46XQABQWk5HR3BbintWEhZWBte0A/Ztq52JF6a92nKSPPfs1DN6+3+E4nopPPTOcUwWc
         SMl/p9+AX4eEVbWf4FG9qSz1ZtOFup7ng3m0JmRcVqxz93s9MzEVl+kiZJT2dXxMHFq/
         pdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863229; x=1775468029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE4AVxGveFYElOJYqvsklnUotS8GzXrypE1rAqrvJ+0=;
        b=Jgn9T1302bSvfleVPHA+mcOco+ezP7fs4nwENPvfGD/pUd67Ob5mR5Yb4fDcfl4hIK
         OzQaghrMcCUab31lDomdNhcw7vmD+QlohAnRvh1D7jhdjkkjsVrEhyU7SNnPBGPfPVnT
         2GyRiYCxZ4p7vzMAbzNb+qxs72G/KhGNUpD8nqO59Y+wqzVdJilkjB7rNQHWKYLPXvwh
         yVwt99Q0Pdo1StexZ3jsJOwa11gu7jSJGjc1nc0hQhy3tIWniqhFaZy370DlfUPDpgR6
         HolxNztfqNYX3HWFuixXV8RayB6IIYUnl+cj2j9oM77+xib7X+3Cy/wqJI+AeXuqAiL2
         swpQ==
X-Gm-Message-State: AOJu0Yyz3d/BOnfaBjuU4rszBcnXyZN3O3SRg8UeSu9gTXUEBkUqa6Z/
	D2S8HHG7YJDZssRwPWvihj7AZNZXdZalyJoPyJlKSXvB2U69X6oL2xQ6racCw7rhrJeuoOMUeAv
	lK76dvAmyvx/99HxURuHHT94g4yiJ6yB3KCKwBH20Gq3YqgNnuONRuB+3CkblABImbKUx
X-Gm-Gg: ATEYQzwz6B66d2KIqVxg5oNQWl3cRDMk11S3EgHsgZNhnh+u7b5PgQwRoxRPvhSqlmc
	mVZqhBjDbSJJta24f0TCTVwcLXj4fnppgGEKt8gyELZFJHKF+jYRHTHHD3rqIODS//9/Ex0Na/6
	hKLr1tQZM3Pg43ZvDzHI5EHWDKfuc2zooetZB+nZqWQ1d4m5wJhrHczB1FILoLGOm1FOmZ2BoCr
	l7p2jm6OmzPETC9peoMl1uwUl6ZrwxWxoLbES7uebd2iXbsZvhUQgI6eMCmDj2OGUTLqscoO0uh
	qclDI3fTgOnziGR822bqKtvlQbgPe3tdUfyqf7d1rrwMsbaP5tLYxhdFgj2EOQz86DwPRdm377z
	WVTtV/tTE8sldGFtAgj56Krj2TiQNgc1UpasAub7eVoYldG5NyUY0glP3dhObb+BohmGDsh6rdH
	K6khE=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119849211cf.5.1774863229495;
        Mon, 30 Mar 2026 02:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119848871cf.5.1774863228804;
        Mon, 30 Mar 2026 02:33:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b72760506sm2312288a12.5.2026.03.30.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:33:47 -0700 (PDT)
Message-ID: <7459476c-3e21-48a1-beea-824cb3504a00@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:33:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kSW0vPmotPkfGr-Ly08Igx7po978IEGB
X-Authority-Analysis: v=2.4 cv=efYwvrEH c=1 sm=1 tr=0 ts=69ca437e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=7LG9PXmp4f4UPxoLl78A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: kSW0vPmotPkfGr-Ly08Igx7po978IEGB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NCBTYWx0ZWRfX5RVrZL+NRSh2
 culHIYlQQyjzrDYQHOH3+b0067zQxGbmqJUewyH2z7aOCU9w1jQQcUFqw1Gfj55z51Ibp4zD8kD
 rOoTSZaaJmj+8nEp2RACV8nXkcbLVXVJF6Ezhl9hhh5h7JAHqdWA9i1SEdrg25Tf4Z2Bhm/DkWH
 wcBA9Tr5+UBS8s3THpCZkR3n5eV/PWHpLIkK1BY5Oa3JpfAS8lrky/aToukY3ZgxkL4HMdxteSV
 wDMAxeMYby2vd7HhyygYgJy9rpk1VSqn+1gZGxxMO2FL6hvl9nMUjRrLOyxBVkUOoo93wy5sp9c
 r4+IQo1d4pnWf8jjZqnd+qsKQ37Me08r0x+fwkoFl7h66WDogTpRvOcJZBGipojmVST/+RiBiEF
 NCs95c+fsMnLTr/5TkL5f1Sgnvr67KbRFXySz9fuef73WVC5w6eI3u7zZ28zK5MqylLe4Zvvyk9
 4jZW8MIFzkfZZhydJDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100721-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 83869358477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 11:58 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> Values are taken from the other geni nodes
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

