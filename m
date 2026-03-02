Return-Path: <linux-arm-msm+bounces-94950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oADfOayWpWmPEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:54:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD51DA316
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E9083031B07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D203FB042;
	Mon,  2 Mar 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcCan2Qg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIno/7Fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3352D97BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772459528; cv=none; b=mXjT6XZxAA3JrAP2uG9J1Q7JLfKr33ISkVMcX9xWlF9wHPf+OvbRNMnRKzwpJ3KIPW/zAWa8qmuVk5n7AaEGjFft7i82b2XcsshAe5cpM8i1kBAqOKoxqYIAB+/wVzgUXdPKOSejqsfzdFxakWnvEDd3bCDCkUuszb6bqKmRPvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772459528; c=relaxed/simple;
	bh=pTXk5xXF71C82gIjcN8CPz+Jy6lahKr6lc3KCV6lw30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTIhkEEEXSS0ppBBIbMRsYZK04XlOSNiYNVU8DLfmGrL9qD1hY/cr3GSb/aTkIqnFMomTWCavcWzc0B0C6tSRA+/agYEErCyU+JqSSEf1mCxSNL1yH7kGagais5KJoge4mNtacqxYp5UxPVCsTHqAwada3BMC+Zzc+OppjKxCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcCan2Qg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIno/7Fj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228C4Kt3223577
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4VHZ/2a4r0oDdBFwDFntqjBqinFJ+GpmPcGQg2BE24=; b=DcCan2QgST/GJ/x8
	BaWJSRpODmu96tG/68Ac/MM98r1RIwi+EbrDJqFFgRahwKtx67PThSwCHZbbbSFO
	8PPo814sUSs7IJG11sryHQSLL3Y9ugIaSv1bNOYmy15/Ufpp/X026ik1OuKdZE6k
	6sOpQw7ICElPO6ktINNytqdP4MgSpI59XYkrW3Q0pGehJxCkoBV9H8HDwa9e2lcb
	iqQ5OGCU/TfuDjSNecrie8mQ+8mnj+fXVrCqanAPeJKjvaHupJMcjvVkLpjAMNcS
	kWgcNWlpteLOZyhIpMe+jDhA8vFIyb3Pxf5lVRQw+R2a+Jzm3/Zwb4m8cGs4Cil4
	sGr3nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1jd20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:52:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7177d4ab4so476174385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772459525; x=1773064325; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4VHZ/2a4r0oDdBFwDFntqjBqinFJ+GpmPcGQg2BE24=;
        b=SIno/7Fjsykf8QT0pWPgqHvOKDSc08FS8pyThnj/imWoX5kbJo8/QLQi7mrTxuT4kZ
         9Tq6wK6U8ieIwS4jYNQ/f4MJsxrnPaUTlmEh7qJWxx3aYA83dSPCdbwylHci/Ix3JQbp
         36MEVRQFtbTkMRG5tHw4MQcni1V8rkw+KgvwqbqspgYcjZQkEa80hMA7R2in3XMVMehZ
         1PxPLb22dAv9VpNAMTiPkMClb6sa/p5Vw2lxAdexoOMYCVheEEDloPzcuYKyynLIyIUe
         fJ7UmqPuXHHt+570NizH8yXGqtyHdpKUSI0lT1KOLH8+6T9G0PlbAcPZs2GuuX49HhAb
         36JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772459525; x=1773064325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4VHZ/2a4r0oDdBFwDFntqjBqinFJ+GpmPcGQg2BE24=;
        b=wxAiCcYDB4z0oWwCvY/O/LdMKpZWJQeaL52UwrdyYSDuWXDhd7+Ey/bI1kQYcPmBDM
         CclprgEcK0vixqc3gdeJGiruMI8gPco1MXwkcVofAhy6NoGEn0MwJOs4/5cOXhb2ZLGm
         aNVrdnuqW5xoGlSO5DWmb0sqIh3TQTvEYfLjaAR6ZzYvpVrIITOpjYwoUXdC8QExNkQY
         fYPZcSpe61pEhrq9xAkB2IC1HAvbuJPqYsMcoZlKSVyOPnTIgzRYkoGw21LUUU2LxNMf
         +atoKnzu6vsOWroJUa7T1ypM9ZKAmbl9JEPLZryxLZI5ZFJGlyTuMPJ/hoZHRr+AVC7D
         7p+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0L+n7OEecVQvSpSU8aoi6Z7+CwuQyPtqgvM9e0/FmwMUfJe0yKZ5QNv/aoGLYKs9c2/1+XmcdGA1syTAq@vger.kernel.org
X-Gm-Message-State: AOJu0YwCwZp4lI9iRDjOpk0SiumKD/IL6NFeIx1tovxrX27CPt4KsgQd
	/7wMdR4DzUydEOeI26DW3Tydcj3YBoOOZ8NDUBeOUY0g32LDN4NG3EviIZkWhiditBIY6uGLGdb
	WfvunIXZPTBreeAJjeObswFgl18rpqHMazovMt7x+gIHBEQJJc86BWy+1DrzDXmVOEo6LJ5VRyR
	p/
X-Gm-Gg: ATEYQzxxnv+WBduT1OzeEyT10w2UDCgVGPlhL9smJDKXyxDBsULfH+eGZMe7JyOek70
	FlH6Ytq5U98wR8B4PG1ozMYHGKQHBPoPeNDTHOEX7OTytg5QTcuHMpBbq4PPsQ4/Th2z1m7fx7r
	WSF6d+XRngEZqRPuq7GG4sN7bivUIANFSKyyd3VlksvldgGKj+x+7ecT/H8n6iv3eLGU93mg5Po
	N7mp3zRVrmdpKrAmkziGNQkpdgdwHxhOduGeEatRx5Y6U08erNJkoZEmYJ60r/XogoiLlxB8C5o
	APJjHbcyMkce/HGQccRRBIHe25xXs/mCecn1C+qd2LkJJ4bpYgbBOmKu/urBelSROqhn+/LFlvQ
	k5p7SQJuqB9nBgpjPzvV6q4ygrhWzpBovwK7FoQ6tSkexWRizvDD9bfTt+fgHtSpk2eY+TH/BYt
	7khEg=
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cbc8d9834cmr1097009985a.0.1772459525437;
        Mon, 02 Mar 2026 05:52:05 -0800 (PST)
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cbc8d9834cmr1097007285a.0.1772459524976;
        Mon, 02 Mar 2026 05:52:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac51843sm491168666b.16.2026.03.02.05.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 05:52:04 -0800 (PST)
Message-ID: <4cf9c98e-767c-44d3-9e71-bcc790e83997@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: sram: Describe the IMEM present in
 Qualcomm IPQ SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260228-imem-v3-0-20fbcc1a9404@oss.qualcomm.com>
 <20260228-imem-v3-1-20fbcc1a9404@oss.qualcomm.com>
 <20260301-secret-exotic-nightingale-80f55c@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-secret-exotic-nightingale-80f55c@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uN_WumyIu2Zq5RBq-XnhXlnpf807MJBf
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a59606 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=eMU1CfypTElMI9egygEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uN_WumyIu2Zq5RBq-XnhXlnpf807MJBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNyBTYWx0ZWRfX//PjfHSmkbBB
 HPeRn43ul27gXdpYMTTa5Tqb8CbTh6uiiNnb6+WepH0/mcnfvpVoQACAAT8xjWRCg98X6RJ/6Ms
 +4Oqmg/temaDVUvHjiKU3rDRBRRGl+vyI/Wq9zaeC8ihCkjuBe5EgTLuO9fter5hMcg4YbGKQT+
 qU/sS6tgOm4eLk6XQ04UejyBs0ocOW93pebaargpQ6zjZCi7qzznK4kQUqC8quG6M5rO/VtJU5b
 4eGHnBf3HUzLUSa72FSksPuPAFOStdCza7RqS1ztI13dYQA5SivQhs1rBiZxjjhStVLEkAk006x
 hHcjmj35kpsPJojNQ/h+/0WWpj4ERlTApjsjSyuUIEdKQnTxgqoXLQysUkIBYsflEdzUiVtmNYL
 eWu+7fpiTAkS/5Dyz2I6qDEYXtv9M5iznY1KXsYQ34sOZUInNS4EStYBVkqCL4r1fpQAsTieEOC
 iWMr85ixVgWQSe/Sxbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94950-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64CD51DA316
X-Rspamd-Action: no action

On 3/1/26 12:27 PM, Krzysztof Kozlowski wrote:
> On Sat, Feb 28, 2026 at 06:38:00PM +0530, Kathiravan Thirumoorthy wrote:
>> Qualcomm IPQ SoCs also have the IMEM(On-chip SRAM) region and used for
>> the various debugging purposes like storing system restart reason and
> 
> This binding does not allow restart reason. pil-reloc-info was kind of
> allowed, but now I think this might have been a mistake because that
> bindings were posted incomplete.

The sram.yaml binding allows any arbitrrary subnode (sort of like nvmem),
so long as the name includes 'smem'

Konrad

