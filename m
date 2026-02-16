Return-Path: <linux-arm-msm+bounces-92925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MQYLaz7kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:12:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1990C142BC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83E013009CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD4822B5AD;
	Mon, 16 Feb 2026 11:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQ3aZ6jW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYBeS7Y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8E2D4816
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240301; cv=none; b=DAqlnwthwPBASoqfIVyAp3y5IkNlCiUGnJwPAVb+26YnvF0XIhhNDtm+4Sy16L/7h6edv3TBF4gFd5IN7LtR2ayF5RgHBpeIuxp8/33Itj2uJHQ3iIm2rhYBuOOynfqge0bq0mCaTC1/Q4Ku32Kf+ssLdtrcyI0xCrJktSKb8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240301; c=relaxed/simple;
	bh=29y27mL6tUOMnoXbnGAKdGPjKx7fYV1FlCWTRdzh8Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vtk4oINaFT2Ov/bTGv/m5bp6uxntcysJetFDKDWCB/RsXThQuJTJDR/kTLG+z2XRH94jpleej8SUUNMnD2kqKwEztODKAWFSoOGMmnagUV0SUlgRdHafegBeQB3j3ORr9KIb6yYMzeycSI9jcgIszm502oY8H1OXIBtDeMEFnIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQ3aZ6jW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYBeS7Y6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMSYhQ3551736
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=; b=TQ3aZ6jWYVGwZeLe
	p62YQGl+hOOxwlBdeAlDzWBruQNFqGQaGUh1lHSEtTNY/G/Cztp0ZNVPsZgEODJ9
	aFOH6mZ48ygWhmGb5ej2j4h2j1vjzN4yAr97lvVWqU1ky4ZUFWOe9t/y+tYU35bF
	ENIFr1mwG3htXVaELpXkpQun076L1b4/xeZVaZoIL8p6o2ZL0zo6NtWF0u+pnz8e
	/9qP50c10jSKiBDaf0E+26hWB8cboP2FCTBzE4J4Y69naPJrPJP9H+NM0u4ilyV9
	j4OS86ncyJ5c5qfBvpY/BFgoIOSfhm8FPxH1OXWP9jrTHN4nFUD8CooEYZZCUPIn
	SLVL8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24ccsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:11:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89547ddf32bso22177336d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240299; x=1771845099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=;
        b=bYBeS7Y6iUjsF1hHpX4y6ZNXTn0bCvlzztk5rzTjtqmiND+HK+8OAO//kaWnwc5Zbu
         Dd2noHFgqNMMBHIfLh6XbUFij5tD/3pLnMSPHNdZHBtAGkSziD503GjY3sa7bLSlHg78
         skjj5EXATzGklpbwew8LU18J/IH6fH2uDBf/bDCQN97cfA5fkhzkFRiL5EfhB59NnW5K
         ajtMiKJBlCh8vKoPUZq2adLiBngd22dourV1As18uodze100+2PkeXQPQugq472gY8+G
         dlIpIQ6P3Faae3RPF16dFvfA+74qJk4BOiXp3p8WfJSBn+zZWW8td+ZGAkJSIjz2KyaF
         47lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240299; x=1771845099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKB6cyGrE4BAJIV9F50Ui+1juuhpnbI6RlG2V3H6wT0=;
        b=vl+G7nPZApt0VI1Av6sVarCBOvymsCRqko41iE6ziXlzsr+TJlB/VcplbZ53p/M2ej
         kzt9yH51TkydTBS/Vsfe1Gsu1ow81kSs417swqRE8Bpo1KP9MzdbjP6JCNu0XhPl5pza
         qR7orfBOFNnx9khD2S34+XqOWkCwo9exOAdiyx5m2ktG9axR/Eq8kbmhqbvWd554fAMs
         1++6tSQHGsdd7gLP+dnFfwQIYbuAYCn9c9B7T1FS1V3NVciwhjpeUIrxS1ysfDDGVbyQ
         ixdZYfVtHx+IIHNT9a5mf3/BfJ162McQxR/Qum0t8El4o7HBTEhD/ux2zedRbC9xp0oh
         lvmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JMWiXm00fVPWnZK5dmqDzhCd/bh8cLckYvda0abVWlutMkxjYmZMWiDSJ3bH0LnfjceP0oGEB/WDq9xa@vger.kernel.org
X-Gm-Message-State: AOJu0YwZf8dM/1gwOxY/IQWzPxHEi4a5OpuRuJO0DOq7DMcCrIoP7/Wf
	+rdO4GvLcedXvVEh2Hw13U0X8kfmo9T8PRQTmsOoi942c+hIx26bEweK0MS9BNZzFhqKqwZs7jP
	5ooH3tlk8gfP1bi25hEQTOqc/INwPtK4Bz91fBPGXCmm/NkKlqAnPzjtGPpgAf+1skPeZ
X-Gm-Gg: AZuq6aJSlp35FFwe0gGMI/mRJJpl0+JTAeVHcfLoO6D93SbeKWNgDuKL6qlMkJvZkU2
	BhjsE/2ZSTGEQTXGPS/mlXiaRdNNrKwmHVDzXumpimBmVED+hy0gm/Xbe0S05nMMTKVlBw5xBAY
	DowG43hdmUnHceBDc7Hq8xWIUL08hHW4tA09oJxk68M54m+Mfm3v1wm58r4C9vf7L7dCpCKWm82
	UbHGfnBTQ8Tv6ZrtX9Dl9y1kNlPYEtdnQVcIP45y58YAztG+FAoSB8jcQX7B97jDyqtRuR3OCBq
	HrwUKL/cMk1scv5VowZkVs0Pk9m7bGtMoQ6hWTj93F/WJQ5OeQi/ulVJf95phomQJVgikcZjZ8D
	/K04Z2uUtEt6fbIOswdD7D0hKFIMTLt10VmaM6xy2/awWIBoJMJ/MyHJn5TyTFhC621jSmZMSJx
	8pZV0=
X-Received: by 2002:a05:6214:5c89:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-897347cccd8mr106434836d6.5.1771240299014;
        Mon, 16 Feb 2026 03:11:39 -0800 (PST)
X-Received: by 2002:a05:6214:5c89:b0:896:fe6b:8bcf with SMTP id 6a1803df08f44-897347cccd8mr106434636d6.5.1771240298606;
        Mon, 16 Feb 2026 03:11:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc766459fsm251257366b.45.2026.02.16.03.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:11:38 -0800 (PST)
Message-ID: <e5a25ae7-a17d-4068-8f56-4b8a55f0975b@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:11:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] firmware: qcom: scom: Simplify mutex with guard
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260216091525.107935-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260216091525.107935-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z1DJC1Zvy4_qMX0LG9oj00RfyUdhdV_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NSBTYWx0ZWRfX164O6fqngrSF
 N8YC2EUI5Fh+ftoFjkasRAxwPXFXebfK4S1J8KGHa1udzJS46RIP1STKDe6JBiDBMJHQqY45+Jt
 2zuxfHjheXovgfrn0dpAzTZ5joI3MkkdQSdkEg4aPhblzR9d74oA25r9XLAJPRILxmeXRG5ok83
 M9MWtf8equVKEHmHOpjECIQgyE/zowOIjA6q7Em4wSoxgCjy9+m7FHWZyr4UL+pA5z2SD2Py+zJ
 bFMqVU/07pP0mXv9wMvrsB0xF0P3UKeAgGWyWRtp70op4ObiEdTXTo43nDk/Ux3YrPuSUydtsg0
 uAfwk0ulbPjL0hCl5PeUorjQb8ca4fRsjaAWVEpDrLrnLfosU+zOvz/DoKh6FkE/xhd3VtAPs73
 8Vp96bSmbREvhzbP2kyFsBXO0M6wNiN8RhECQschJXwRFE2ah9ltZ+M/DGtbMiKTXey5Gw5JBbG
 sQF3M20KUgu7SjxvI0Q==
X-Proofpoint-ORIG-GUID: Z1DJC1Zvy4_qMX0LG9oj00RfyUdhdV_p
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=6992fb6b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4QM0Md_L1v-EWR8JfnAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160095
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-92925-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1990C142BC7
X-Rspamd-Action: no action

On 2/16/26 10:15 AM, Krzysztof Kozlowski wrote:
> Simplify error path unlocking mutex with the guard.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

