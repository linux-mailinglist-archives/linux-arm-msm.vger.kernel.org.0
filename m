Return-Path: <linux-arm-msm+bounces-118314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0ynOE838UGpg9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:08:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE44A73B9C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 16:08:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BbehK0QK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CVnCyikS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118314-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118314-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ACC41305BAAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F3630C157;
	Fri, 10 Jul 2026 14:04:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D462BDC28
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:04:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692254; cv=none; b=D99zdhYQ3j6wsE23ulsg8ndHtU3v/3oFneviWjaf4MIe11Bf+GID+a9aK6chRcoRLyotj1h4YtjdjcOxNflDwQvQ4Zle3AfmpRh+MoiBRt4LCxBug8ROuyqjaTHuBzgpOMpw2Vg4fQlSR/NXXLH22SbkVE0KF0qInEdTdSnb+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692254; c=relaxed/simple;
	bh=hWmKl4wmptrKz+5XBCLWWbjpeoeG+4z1lfyPJaErS7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1yqmRsaFP8OUoLDgMaiuauSLDX56bVQ/oYDifcGR1Ygd83sQfvvIr6ThRLjlh2zIE1C0tCK3gEvh4g5F94Ddq+uf7PJowdbKlxrO9TXGltLGbP/5eJeDf9M0j88rTr9ayofOjpXmZqUDTNQ/8bED71uUa4Gw49RaHwXiHm1V4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbehK0QK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CVnCyikS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6Wii823144
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=; b=BbehK0QKnqLrS0QM
	fryYAY3GD1oikiJsEeFEFPbMPJhrcDs2t/T1tnXADN8xvhQr1zLpvmBJV2EggxtH
	xj+phWHork30/qKYMrHV3KSLRT39rBvv9H5oCo9JwkTkW+H82QaL1CrAmiUckS26
	auVT/r1JMulGbKO5Gpr4xKj5JtqjmswvBwOxR9iZL5fxNWyzUpmOjd0MujTQ1VVq
	Zf+0LjEb6hKzn6jHo70at56X9+P3Jl9prHI6BWGQNUgfh+5/YSspx7lqjibfWkWk
	DWZP4pZ34s3rtmXY3FF6a45G7e9Zb+IsnE01DJTt0+y0arip3KcQjEPL7t1Uzn+E
	J1ql1Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjd08h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:04:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e69a569ffso28716885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783692250; x=1784297050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=CVnCyikSqPZJ8oTT6O1wqyF4Xu/hnjJM2xeqLgi+OhU7pggOiXGq+kxrymz2RzPkXJ
         X26y3EEF2DIkjb0IB9Pa2noIFYNKuVskL+VlUFfCKnRZDpxiOph+QRyWev1SH0XxEcdF
         squRGYVHZpUDL7monpOw+W2jzARhhq6uDBuXoi1vSdA0rEK6Bt3iFfKtXjI3k1KezSiy
         s/Svi/2IfsIxE0Lb+TGnuW/v31dn4VKEOBgIasKXvAp56ZFQMv06TH+0xJSGhwEab/8T
         isbppJXRzQHcBvHvspZUMleJyCOOzT/k8wiWwhHUvwiGIDEELQt1wc8VXZwcsy0NXSzR
         54+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692250; x=1784297050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+XJCJtu8fH3qzIlMem7W8KbzE3wBnhOhZ1Ej9WZ5SDg=;
        b=YoE/6dqBBlQ5UQ9JTZauFOmQaFSGnRrjm5p6pbr21op8y4XYcwulbZmRMgW9AKVnzQ
         0ABkTOGzC1f5iauEIpndCVPoMhGz15tkEQ7ytzjbqBBvdWsSV498DJKFyXfWxdat/YY1
         fPh2od17NG7bAJ1Kadx2PLoprpaUFw27U12S8Z7qRcfps1UO0gekcwB8fE9f5iw4x/v3
         W33TV6PQVa343/EHMXe8k5Db6TFTYORtucjDXfeldlm8YSuCeBbkGE6/vNZlxSLvNjCz
         oBk5VtkHfqQeY9rmBf22ttfk4FYQhGM5BlHJWO7qcGtXxKJbCIPC4pVUHPIYR0Z8G6LU
         66BA==
X-Forwarded-Encrypted: i=1; AHgh+RqxzXLW7B5AKTBENaIFH4YbBPx9Q5NFAmQrnNViJd9dJHYBan588F66S0KgcuF1RApV4+YfoHhgEF7kBakK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5T1BW3dZnARkJ4LxLizTVXLAoXTXRvwWlo9tMSWOXSIgoQA3o
	lwz5U01HoR+i2UST5ePx8XKpzdbwFmbouMkPKt93hrmDl5uB6QL8XO8EmQ9LoB4sm0rBUd3ExHq
	p9q6812ShbuvAVW8DhSDi8JdHt55TRqRW8ytuwne5UecA0OVCJdS/ZLtyiT+4go5stkxe
X-Gm-Gg: AfdE7cn3jaX58ySwlbqiWHjUkZOhjMVsYURqoIhRFMAGZz1FRQ5xLhwJVMtMyc8A4lz
	U1U6Z2ndWVP4Iy7qm5kg15jJyEkordzQerqe8HxTMe4KR86x4ZTA8o5DTapvA/XmPHCMU9D5qK1
	g61NFQ76s7A1AIjLcdDWb4lCz/eaaIF4tZZuD82oWGgNe9ChC7hDRg02/LR9Mlcv6l+gn9vK4OD
	AtbiLkpdLKZ3LXlLEwPxOTQV7j/CFeY4+mg2ob9iosrTaDZRdyDvfP9K6OopboCeOJffLxg1y+u
	/e72h+iJ3FX3HCgCyIvbCzFV7KZsB7+bX32QlYLCmk8+D4CmpDKvZmlsmNEKqrTUlRV9vkTTbno
	2nVXql6eS0N1Z1Bo+/+vOx0GdGT3VK2+7F1E=
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698107785a.2.1783692249868;
        Fri, 10 Jul 2026 07:04:09 -0700 (PDT)
X-Received: by 2002:a05:620a:454a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ed77c7d64mr698087085a.2.1783692247367;
        Fri, 10 Jul 2026 07:04:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15de6c565fsm311138366b.2.2026.07.10.07.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:04:06 -0700 (PDT)
Message-ID: <0acb2194-3894-4cdc-8f74-a88ec3670d4e@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 16:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
 <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX9HNroDCuIfSp
 VhOCdOLB0YNCVUoaROsXAFN1/ejinWLW2P6CKnLKbf3O/xQgHq7BA8ZYTvuuvQduzOAs4cm6R6B
 KbVCvfw6KbtviC0W84MfcJNrbo6thNIbeLhA11N0LW4iKKEaFkyICPy/uyG5pl9Q6oqL0ODrHgT
 Jfg50QrXBpZw64Q4P0VG8C1MrfqLK1+Z/3kYoUzmQ7qZwX5Hq3aFBt8DcVjw4LpehEkjJPK01GK
 CKY7Ej4kSFF/5b3Hy98IdlT5l3WAqeFvqXwP94UKenaHRVNsXb+msYSRBuinK1W4hCGF7YjFwSI
 P7L50Sr1uRJhmb3VEEQ+Q+85eCBfU258LonibOZo0l1Q46kaagTbQNgaFvMChNivBIZ14EvC16d
 lpPuJjZGnXF9cwm+f7Ag7We2l7hEfzBV+AtlfjvrUzqlFa7CW5b8f/HDDRqbq719HfhPoGXtN8Y
 +OAmHV6jtqZyEC42iXw==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50fbda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=_B_-jDzFwVDfZiktVnwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: NH2oDfCRRAmE78dggJdZrmrQeuRYwF8u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE0MCBTYWx0ZWRfX4zsutFNxC9xM
 SZGwScYJWidvc/qFP//Ptg6icawhZz3VVqVRL2zY5T3Ge2ibN4zYfPcI/p+xE5qyFbfj74EEKJf
 wesgTZWHOs0ZYZEQVPIhWoPr4vHMIjw=
X-Proofpoint-ORIG-GUID: NH2oDfCRRAmE78dggJdZrmrQeuRYwF8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118314-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,fairphone.com:email,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akoskovich@pm.me,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE44A73B9C3

On 7/10/26 3:58 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
>> On 7/10/26 11:22 AM, Luca Weiss wrote:
>>> Add the OSC L3 Cache controller node.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> I'd suggest to squash this series into 1 big patch, without patch
>> 3 applied the OSM driver will engage and perform sync_state (with
>> 0 requests, so it will vote for 0/lowest) and the system
>> performance will be tragic
> 
> Fair point I think, I took the structure of the patches from sm8650
> which had it split this way but yes, it doesn't make too much sense in
> terms of keeping system performance alive through bisection.

Please carry my 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for the squashed patch 

Konrad

