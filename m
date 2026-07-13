Return-Path: <linux-arm-msm+bounces-118757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aEl6KlXYVGr5fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:21:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360274AE18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:21:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GxDX0Zl4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HcR9JXGY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39C430C5275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD35939EF2A;
	Mon, 13 Jul 2026 12:13:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014083EA962
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:13:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944808; cv=none; b=U+1keMxGO3nGd/tVYXpuI7L4w6dTex3qIkW5ny3uwDXBv/9hQfDppb9Kgh8SSrcQ+zOVR9bBYXg0tHkcVK9d6DECoBnRhdk7Ee/s2dqtW/yVBzCv5Ss7T7JWyNz8HQ6fZnCLkf/31UKbtvWrAfJjRO5bREBchonPgyGpbBpI+b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944808; c=relaxed/simple;
	bh=/+YNpxK8VvqYO6ud5YovbOzJ9n6cn59opcOgtT0B0CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tli37Qi2rn+TuaVyx8+U6KTTfZwAyBtPphAPNln7uWB70XmWYCZmSXv5mrkWkEOY9Zq67ZRX+JtEwcS3A4h/ZOkRJfgyuHb72rO/kQiAMvXOKT+iTucXG+GHR/JoZ0oyNoezx3dtQ+Lib0ZGQa5c8ROA62jP2rlJUeF33hRTY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxDX0Zl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcR9JXGY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DB2Yvq731641
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a6gXJTiXC1+IEnpDhnD9btxlxLF3wET9+C92ZSa692c=; b=GxDX0Zl4ANEV29n/
	knCCpXVlBxLxw/SvayQ2A2NykP9jjtCXNWL+Uk94vHIp+79E4ayBz4OZsTmxxdlp
	hnmWh1vZE8/YEtCcMuNu9a5OEulJGkg8sEkktkazv2sm+Qm6j1ONAskY/5FYuhTV
	jwsy1Gp3r5zvjzlozGSr+kyUnUNVYGXmlutgBvIocgtzFJOF9Fl2oEXOp1XURJqm
	IcxCzKTq5VlH4exYxiNriHje8S5mk0pMkiI896FLaEgxG1PiIoz9gWo55j9RJ8eO
	VD8bWq2P7kUJwALmY7tWR7G2bcpbMNjYLO0thw3Ri7RKlkkV4AnXX4GBSq1Aj0y/
	Qo1PtA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3ae0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:13:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5110c89eso73699085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944804; x=1784549604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6gXJTiXC1+IEnpDhnD9btxlxLF3wET9+C92ZSa692c=;
        b=HcR9JXGYs1Z1x5M1vPH2pDuCUZuAxjEl0qoM1yYom88kCYNYXl4nK88r8SRrAoVlyG
         T22/z6KTl+h+U/hkrhehyr5WN741HFNWpcIk0INZWzxwNthGIeV6cPxqZiewlBRm/051
         lrtblAKOEB10Sp8iY9YrL9oCs8YwZMkhJCKXgxOVHUDjGXt9AMX/CiprO/UNgXsc+Spn
         LxtgfvWaIIvjL6HNriveVs2Ru6NOCxZqVINZOUPCPbXsMm4jlSQSZh83/Ws2qZrsavTO
         lfm6ImDX2QvGBTm7dJK60Z17TthW9KQpvxa7hrKAtjPEtaQZ6cTP3d9cFl6TbW8Nipxh
         AZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944804; x=1784549604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6gXJTiXC1+IEnpDhnD9btxlxLF3wET9+C92ZSa692c=;
        b=Ba6P0xffXTjzcQsSMhyk2U7HVl94A7wkzGhZYnEetlB0GcnzQrH0XeKw+AJDMn6mJx
         HoHoG8mDyNRnzRhU2fCOa3kxydVAGOBmOx0wsJwT1YmLtJ/gMdUTnXVI/V73AFfdaJ0o
         kH4yO9JqdfQrmMsloLISb6DgLCOosrqw5K/ntooNAVagpOM5tUptArh9ZbcX9ojOy38U
         iw0QOqQq85j8Eb4OqJXYwddIvrMgf6k3/9JkUhjXku2nF9NXrR+45PBwQCaLKkQgvpMf
         oZc2TKinljRzv2kJkNS6y0+tT0UJmlImYNV6x07nzqFFBYcmm8qdSSjOwu6TjgNJdP/F
         Fu9Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq0HCNF/Z8+6bui4L5uPbiYHAc6QPwoOWyZgaDqDmyBvv9VL9Xh0BTp9vTJHuoOG2rRu/KEw44u/Q3VHutb@vger.kernel.org
X-Gm-Message-State: AOJu0YzvuTUUoGsfiAOawKXWiu0AYe3UA+dmhhIDF+cV0KCqyG3jPP3M
	aGyAeFhDpixdjuPNzXMLbjLvFkslRhGRZ6xHaJ2KrwQlhKaHxBBdJR3Ho33kBenPurpF3iHanIu
	ybNxS8vf6dcQK0NYwb7RN5Zy0wZbQWAtlqC+9tkTqWBMHL15fFHZenHrFFt/VSPhJEMXc
X-Gm-Gg: AfdE7ckWOXotQgJQODKMHT4CcIAeUn34yhsz9EL/VsedVzHVluMxwRjuATlVL4xyYBh
	ZE53XOoCWS8volo7w1IVQspAzwiQhkBm0j7ci9YyCPqf90CfGK6OnxVUofpny8GoHbGggYsfJDN
	t1WRC3y4gF2ESC+KDqb0FoKsMd+nY3laLJmqpza4/oUX/haHPilZ/k5u01uWHqeL/YlcP7LWSpr
	ZSFolv4ASB/Jm5nGz7MfjbLDRPIZ1ux150MVpzIeouFWme0tp20lUys43ioj7RxumFUWWEC1XhG
	wyLNEapdMR5IduhcJullOid8IgSaxjEQGNw+DcOAA10b7Seu2hW2EKauVVXVVif4Jv+/WKQDvOR
	tt21HWe6rRGvhstKv5GDFZcZ7J7qOHpUekJs=
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr689956485a.1.1783944804526;
        Mon, 13 Jul 2026 05:13:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:915:6433:2599 with SMTP id af79cd13be357-92ef2b10cafmr689953985a.1.1783944804129;
        Mon, 13 Jul 2026 05:13:24 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e84a1ad9sm618621766b.24.2026.07.13.05.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:13:22 -0700 (PDT)
Message-ID: <8b8b6ac1-d699-4ddd-8d86-9c26ee45efac@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
 <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX7p4R81Y931/F
 owi45gFVlPkY+Yz37axBasApyMuNkXLc+OPX/04vvqSn03tQEQcMMSJm075Rzzi1JcS4OHzYaJR
 akx3P1t1Ti2Yhoi++O4vZuQFWSYHegeAwzGDE7VbVO9G+KtVYJI7tbbESO0sLESk8/uMQW4JkmC
 hYVSjpOmv2olTZaAKmxTs3XWfPctCcuKjwlsoVMaE792jINcj/PTcLyB3L26ZCt0RhSsKtII0nc
 TSs89BMnMwHAj04tEdCIAlt7J4arXTVSZeWmof9bFq8ApPl/hTJIatcQJAKjfVwsQJ3kU6TTZO6
 MkUOiTlGbsx4nTW+nHkzL6UnOcIsx5WWWWvhXIx0hszsfupLst4HqngDqC3xgcIJur4pQ8yfaZi
 gG46hmMWgMgeV8X+VfJq4xxZDTVt5MWJ7VeAfEzf4bqYBhbrNtvBwYz7BGu6R3ha3EXXTubKE9e
 tRexOGjYFqdB++rxaTg==
X-Proofpoint-ORIG-GUID: _-akSpZorayNIJt3rXmKZhx9y5_xGorp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXxw3bbCckOAZS
 4c3scEZ0j8l+eCTZJAZpCPlaR90Qu3ed1YexZDfIqoj8ajNHhshGYLTieSe9Dw8Z9Cg5D51SjGr
 eMJAAP/HlBwzvvJ/IUANeCd07k5i1/4=
X-Proofpoint-GUID: _-akSpZorayNIJt3rXmKZhx9y5_xGorp
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54d665 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Jq6lAVB8MRYJtmNLQKsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0360274AE18

On 7/13/26 12:26 PM, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

[...]

> +	panel_bl_en: panel-bl-en-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
> +		pins = "gpio91";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +		output-low;
> +	};

No change from v2. Dmitry suggested the panel driver must be updated 
to handle this.

Konrad

