Return-Path: <linux-arm-msm+bounces-90267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHBWNHuMcmlJmAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:45:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7410C6D86A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 21:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCE1E302350F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 20:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CD038BF7D;
	Thu, 22 Jan 2026 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfjEyI6/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHJ3yyo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03A2FC00C
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769114719; cv=none; b=qQ2ZIqrUiys1Z6vTTIph2y7aIZSTuS5VWb02DlKmXSeWtHsRkDrj3TcTOKmM/bpKGfvIJptzcTx7t0h8DZesfpMkA+LrPE0yEG+wDvrPK9imWq4PfCvs4tF8ukSc5/5VbiYo/HVRyDrVdC9QhrW784zi+COyAu63FgsRBPadjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769114719; c=relaxed/simple;
	bh=e053xQVQfDuzXcqvzyjGaXUOGlr3Sos6Or+hMUSVETg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oh4JFogPnebNLTB5ZfMkkoIpFL6jxA015qtf9SYcgTqo3ZP4AmMWHPOfi2zQJZvc3hGrvlRMickvN3NRhiw6ftBYkeVr3cI9NJUcAsKcptyz6wgXnglqKIexrp082W56Dx1azGifhobuq+SU7hISkJlXK1Feh4nVJ397d8Qsm4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfjEyI6/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHJ3yyo7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7U3j3677903
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e053xQVQfDuzXcqvzyjGaXUOGlr3Sos6Or+hMUSVETg=; b=BfjEyI6/Z5AITe0O
	tCNdzkJ6tYFKpkVpKbZrzJP7jgvDR67SFTXGIHB3OZMkUyt4BuwjIMt69aXMPwu3
	Ok3mwwQDlGWrth1FDqaoA5pILyvRef6JaAhJI0gsJLdBMsprv9+KLIJWcdB9xrv0
	RrZFQvqvaEZTDLylwd5DxAN+dfp7opaFB+dOvgc/zcx4Cr4smvVguViSzdDRCN9f
	coX6c1+g30flBftCPCZ6yO7Db3GC0QaFv0lo1d+XMgSS0FxAYGHObGoWsFyRJbB+
	QKkCAZYJ46HNimbBZ89DF1Cf1b41SGTm7jKPX+60rJjA4H3n/GUZRYnK2cBC8yfB
	Iwvj6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp0q9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 20:45:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6b137e066so43188085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 12:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769114710; x=1769719510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e053xQVQfDuzXcqvzyjGaXUOGlr3Sos6Or+hMUSVETg=;
        b=fHJ3yyo78e6PeFsnO8dyHLm5GlgzHuUBmx/JYXOuwklNLclYG9zNS1lly3lsRBXhXe
         /TJeF7CDxBeEbGLiN9XKuuSbrEhuZURLaAqKbWqqunMcTcbdvju+m0759AjIof0jjjrF
         und4+pnwHvmX5PQmxo/uROxoG/nZTxT2kG3clsubA4A2zPOoWu7wTvaWK7gFGOUC6sZ1
         4NWP5ofrdPCQsS4z73mGRFa1Wgzxrh7he1ILS3mxFCfyvhOo1vQ80mA3Oqn5rGPgVBJ+
         VKJlsbcp95S301du4M9jIq8Ni8bGCSuMPi6ygd6mYM0nztfXk7iKe+FQ1Szh4Wwk9aBQ
         Cuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769114710; x=1769719510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e053xQVQfDuzXcqvzyjGaXUOGlr3Sos6Or+hMUSVETg=;
        b=oTPdzt9/vuyVe+AahaOqoV0565hVZRTVkyG5HZJpqTybOaa8Am7/BergE8faX0hJGq
         b+fxcGa8SaCtMF8UIwJfb0C9THQyZ+YfLYo7HomOTxW+6l5D59uMInFHOX0R6x/q5TaC
         t97EmJKJtAvGriENB6DXnhvCQwtSqY5SAyfR+FzuXkgz8JEFZlZ6QxYn1oQxTgKXqMMi
         B4AxpXcDHfCSfe3naOFtdOV4IT0VXfuQO16eycNzhtzxQemX4qQ5d2K1R6wBCH9QtPXx
         ECi/pJjYb6j0Ou31eKOZu4reVhkvbNFxRGTgnxPc/Cw5kJ09DHPv+j2rZbHP8/s0WCuY
         fE1A==
X-Gm-Message-State: AOJu0YxIjwA+fB8yFkxq89/gLhIu264q7f8OuxRxA70BQu8Bpy1YTEDM
	b+0pufM7cm6vuvMvj3iLgqj0MHJU4RoxbYR5kxnJHvtw55tVZ4FMDOUbeUW1/G0G2EDJTI8Bj/R
	s3ZaxpBkOBYdc2AH2rk4k2nei/rc3bzrlCGJUe5p5zz/1DgGm8sgMREChPdIKusQrFgC3
X-Gm-Gg: AZuq6aJjmSz09GMSSlPjGnhrIATyPwH5ikZwNLg5/GRKeN3uuhQv6cBL4gcezmupvM8
	a8/spMtvdLwAczU7sJqIVPLmTYbmNy+RU+/Ijsg0EEAZkIQI16HVZqoa4ndDqLHuYCZyDJ21xDN
	2Zo2JGP82dKaMxh0fZO0P7pOtorkV3ZwdYBWBOnBSmQH9+Y+/kWb0GUD/37eTki0/ictPK8JBQJ
	kihFlB+hKM3WO2gZARMQmMdINthax+mS5RMt3ApeUJVloYE3kTRRTBl2yjCvnw8TdIvsgkif3uk
	/9Uc8t3HnjIfIuKAcauO9gxVMhYgnc0Ttq+eBupMSzK2PJW8a0KdmJGHnHThzLs553W3W3fFwyP
	weim3/Lqp1R+789OSs4uP4s9JlT+5Cz1AyNIz7zuajM25SbpfrNTvFLwdI0uNaNnpCqg=
X-Received: by 2002:a05:620a:2a05:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c6e2e6710cmr76299185a.11.1769114709958;
        Thu, 22 Jan 2026 12:45:09 -0800 (PST)
X-Received: by 2002:a05:620a:2a05:b0:8c3:9ae3:1a78 with SMTP id af79cd13be357-8c6e2e6710cmr76296885a.11.1769114709537;
        Thu, 22 Jan 2026 12:45:09 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804daf941csm1874995e9.2.2026.01.22.12.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 12:45:08 -0800 (PST)
Message-ID: <6aa11c4c-3158-40f4-8932-8852e949c9bc@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 21:45:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=69728c56 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WBtusvWCBdKd7OHYwhMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eU-Dt4tA2waWIAD5lmmKKXEdAT8fo8Tm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDE1OCBTYWx0ZWRfX5tPkUTdYXIjb
 6Ipb7lCGh2gEn8Vu+EoN4BBHEOyQRBnyI1MUanw8EIHv1TJh2QONtTDwYRX2FGSIJ8OUYWxVT5/
 LhdK6RdA0vqDVe73HXbvdynZlKe8WJWgFhFPSgxsLpybFf1DVykLjWZ8QwFam5GBGSSR3/t2D7P
 lpfbJAfXNU2r2fbAopt31c0oh6ZfAXUxxY94SM5ZKXHSqlRubCgzJaGMnGGxZZT52II+DC/5nsB
 +l6gHbo+gDY09oVBaFBuqXayoiCcOgiEma9gZ/enHMWfNOZZ/tjIONRF+XQH6sZxrc88LiOmd1I
 X1XTnpuCSeEcIuICfSgC7jsDrlSwKHP3ah1+GCZ6+8P5htzBW3wWn4z8qGfhhDl5FJgVpOcsAQf
 Nk3x2cMhJVSrYB1Go7AjaaU0DWIXcslCnSg6Uj64f962csoPy4RSm8W8NczTu7uPj9BhCOvMY+2
 H/2xWe81OIS1M8OIqYA==
X-Proofpoint-GUID: eU-Dt4tA2waWIAD5lmmKKXEdAT8fo8Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-90267-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7410C6D86A
X-Rspamd-Action: no action

On 1/22/26 4:24 PM, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC.

Modulo the trivial bindings dependencies, I think I don't have
anything more to add.. although I fully expect this may get some
fixups as we go, which is normal

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


