Return-Path: <linux-arm-msm+bounces-113430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RJvcOoFUMWq9gwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C269019C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TqRSs0nZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QAtX7+mb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113430-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113430-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B9F6300252E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFB9332637;
	Tue, 16 Jun 2026 13:49:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C01330B2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:49:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617788; cv=none; b=kDXfoJqxj1F8EvxMG1mm4xT0bfU/u6qPh/2rKcnzQLbYJdv1P3ldy29f7ADdvl4QWtW0vaeaWyA+yTFXVK90XpDmHirKgAhyGbzR5abpcm4s/vZ/iko+qEvw6liSRoBmsZ98WrW0q6GJ/my8Y0Cw436jEoKbPNfCphAh5QatIkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617788; c=relaxed/simple;
	bh=U3m38ZnTBCLXT1fk4054kddb06qI29b3fAIMoIUX3d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZWnQj5UB4PkAMTkkclbdFcOeCcgiLwxhLBTtdvlULTzqMWciNmwKtTTmXF9PGIVHm9dGqn47o8ouK/MaW1u8M3hpRwZL8jpIWB2ErB+EI7KolHsyAKGVjKPD19i+VjalfeGdvo3qmjAhbZkVGndbuafhDzT3L/GoVwV6P4t5B2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TqRSs0nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QAtX7+mb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACV4v3474760
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=; b=TqRSs0nZsH80tsJn
	NKApBFk28/sUrKSZbnFoaEoR1QMpvTj3ZJU70oj+Z6bgjU/KdbCJORo28HyEE+8r
	jRLthPsXJEAyq3thQeOJ6nRMHlg8FgFiHXt9kdXB3nx8+dnS5yR/f6p7XIDEJHas
	JTnDI/D/xiRsYc6hXJ/GQJbrF5sDu174uxbwqJYs2Oqi6IP3FkcsreONsj8WfDTg
	qsr+AXbmPJJVeYXA0uXGUTEBNtnyP0P6sh2QXSWPyOQAPvfTwzVdAp2zxDG2J/T5
	FEPY14YrY1GQERhD1yGOtw6lBY6XwcQoEN4Xsp8hC/ltGbtGoriKGrmWCtUxmDCI
	oKwKcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52tdeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:49:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-917fd2bafdbso76618085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617786; x=1782222586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=;
        b=QAtX7+mbWtobvMFm8eXVy2agxntuwiFqEIUV5Q/NH4jGKlsHy8PKBY0loEqX1omUIM
         MhnWbrvFvlCs0xHBSExXdCBEs/GfwW/Lm9Lo0cC8x9PLVdOugobKTQct1MWx9DajcuIq
         rTLwZEmCroum0e79+YnSOuqjQRP5SN+uhyVrsObc9SJlNjw53PirBozxRpTVAYOiTFYa
         KQfBluoLEkv8kRz6uF34VJd5FWdymWdosu9dtSkIMTF4fUA95HjT+fU6pa2yBo4r0jtW
         ASiA9WqcO+ySGhI9M26rI5uYjA0OndHAyiiPsahCzXYbUcFqqn/wRizjcB/uw+ijQ7kK
         YtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617786; x=1782222586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C3HUXZFhXhPH0V+bMNq3sZ3bDJ3F1Q9yHOmR8odBe/w=;
        b=EUzrl1jS6L0u6qb7Ks6AFz1b+yqwwJztPzjK0ZgQnc+i1qeOSK7J4/bey/7WOJDnDn
         do89UeuiIGdxgvhOtwAJbW23HFm+4QyzNt6bQQSs0m29gu9egfPJxGAtGW7R/IFfuXiP
         27t5Jx7VBY7KJ3G+00yMy4aim95/oWxsGeO/AnuMYcT69s/EmeS19Jdf8n07yj1fhJN6
         qbbhI13VlpobLVkBLWqCKyq4QO6pjhXYgu7pUOwduXFk9e8x72aN6dyO+TaZ9nY5qIdb
         kBZVqF313RWZaAjmTC1EeVNf4NG7AEtufvHgShADQWM9P8yjINKBL5a0UgzcvcIzCFm4
         zadg==
X-Gm-Message-State: AOJu0YzELzn6HdfjkVqbFFdNSaGjv4bUkk5PrjXtYBhQTMgEUtH4KKlw
	eLEHLs8WBWlZiwmUNEMSbXLUgharwBjf8ASmqHtfDatjb9RQHaDEuR35KYGuzFjklv9HxXJKTcq
	3Of4D8ij7bnPmHY4/aNRUJjt1tSuU9/H6gvfroQZBKmBRQqPLs537gXtdyR0TBnjhIiii
X-Gm-Gg: Acq92OEevaVz0qEXSEOJ85AjBuaiuMpkEMusOd2EARUg4i5/ytPpanbdGSAOqfZmCwM
	YttiCH5Mab9ecPoufyaRSCwJATwBNIHm7qcx1jsiAasgaGoE+gSIpDxUlR4fTa2PLkuMe9jl8dh
	GfE3fTVg0iNR5zbL2lNkpfKNWxEUDVzNa1CwLruIOfw4rrLtCwFkSUYrgkFkD2zw28802TCQzqU
	cpp2IcVX7WZ5BG39kOapwXF3/aRpFxwj2u/Ms3fx5hl44JHqS2mWN1EKPo1OA5fn27776yot3Ez
	k6OXin1XTZo4AfGSDAP1icFWwDuaoADRlMg31tDid7HMGbIiYUEruGpvdIpHGR8P2oIC50aTi6q
	6OFlKQQNEDV4T5dCIR6SH74susp1c/meYm9iMtmmmXQTCVw==
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1623496385a.3.1781617785992;
        Tue, 16 Jun 2026 06:49:45 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:8cf:d953:b4ec with SMTP id af79cd13be357-9161bc91d3emr1623493285a.3.1781617785451;
        Tue, 16 Jun 2026 06:49:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm645993466b.14.2026.06.16.06.49.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:49:44 -0700 (PDT)
Message-ID: <24c7d8b3-9eb3-4c18-9c47-c3316ce30957@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-evk-som: Enable Adreno 612 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260427-talos-evt-gpu-v1-1-d40b6dffa108@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX2BVvOgOU3ZOE
 cpcuqz5wzuoQU+nC0Akje5X2OR53aj/t4/Bx+7sy952TKyrmoxtAr/k5eHGvzo1LE2av3NIp3W2
 Bzbx9+gZCLy0ecTK9p0QPoow5kaNLE0=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a31547a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX9HWGttcC+mj/
 1z+C01LVbdhI7nwnDXWvcO4KCj67GR5eU0DjLduxEBeAnOXfPUwv2s6ViBoVQ4N7lF7brH163e0
 6Gx1tMWQvtMaG3HvWD3tp7puwbKJ/FpROoFj0TyaF157ySf96wD6cqX7x14+SOQBpA9MQmuzUD0
 dFrd3AtVIOSxCDgPtk7cisx3OscoseB1c1Jl1mhcnT7bIMzg2kRXRZozBX/ib8WzsNW7TvKYHK3
 tT0x5hzz4nHjDE4UHi3ZWNgOVUaY2jjLtax6FrwHw983i3knDa6p4jfaI3qgHUUkKPV8L5l37Ax
 2JDcVu7avW0C1CaMzYwIcUNXfmFaA4/NzDi4m8utfV2cBh6PwSJ1LJt+D5uVV14L3Vf/X69Nfii
 KwxWpO8O+VkV8GVH3rY2A/Ry6kSyMMdQSpsm01LNUBXgxnOOqWJVEKwhpdmkQdXoOSiRoLdYlOu
 +OdjtxOKhrwj0BEt08Q==
X-Proofpoint-ORIG-GUID: oHc_JsMyCDZ0wvB0K_RiYiVcvr2mtfYv
X-Proofpoint-GUID: oHc_JsMyCDZ0wvB0K_RiYiVcvr2mtfYv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113430-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jie.zhang@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 149C269019C

On 4/27/26 8:26 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for talos-evk-som platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

