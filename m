Return-Path: <linux-arm-msm+bounces-114588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6fIJxH9PWow+AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 06:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EE6CA151
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 06:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=F34UUDRq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XPTXAmDG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114588-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114588-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E570D300D164
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 04:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFAC25B094;
	Fri, 26 Jun 2026 04:16:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7801D5ABA
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:16:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782447373; cv=none; b=gcfnLkMW88aIYmRFWegM6ULVBjCfWsKlPLnHJj++dXmv+VgGBNb6RzNYrM+5ReTdaWpD9VGygLQA7qAcRe2jRaRcJ/BUcIwxpFKlKFidv5rqrqw+EZcDy39bAkXJGnQ70f/WeoK5HmY9AnSa37V1y1/qIB+SDGTH/hblsNDaiUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782447373; c=relaxed/simple;
	bh=OQD90EC7EDD38ZCfttN2/3l4QfewgOuFoCIfNBhcrY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQzYXrK4E1ei6x0XMj72bUz0V/By+NYFxxCIV0k2kjzl5QMXp7pxJ9zBwZKbz8sHbvCwgPThJs9SeVjHtnYmOqw3hxheijYliFHbGrtmeGpg0y/kXjsDB+qBGCsUd6u7pl6K0l0FUjkKiVq/Gw6IOpZMZk5baMlmyuHuEG/lC78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F34UUDRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPTXAmDG; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q2j0j33982925
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:16:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=; b=F34UUDRqDwqUfW93
	paaaOwdBKdlAv6eQ/8g1FnjCc4yj/EDGNofKTa620Qc8eG6W3VAUjL3XRnh1F6dJ
	OTTFFIh5NprBayp9j0WgkDcksr1fKGzqsorrG5/adM0ZvBLS8roppkBDnStJ7Xvm
	5wBkqxtmUE9YSa0rUT0wMa72fhOSJciDh7BVQSH02gEsXNGONyv4Gh4YBkuU4AkG
	3uAkEzOk+hBNvHCENDqoFByzprElpMFNNU4Ef1O5REpz1/LDzWtFPZxs4wZYx+do
	hAqYOdDjwzRdTlrdypIMb2drLhrdZqkzczUUWzB4W3FxIUWNHyJ8NYIRqKcvc5pq
	qaIlxg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16jgaypv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 04:16:10 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bccca5620so815935eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 21:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782447370; x=1783052170; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=;
        b=XPTXAmDGR5+nkDUpKBFMnU44tj5QIeL7052JLDqLoLVALQW71pkni82mpMbGwmhg+S
         d+GHX+p7lcrRmcOmaikSLaoiMYuwxymujg+jViAdSycVxOb42dzl0e7hyMloWM2b38GE
         01Eo+J1vqVzIFFrNo/sYFXNypTamW95ot/M/cxwhBL/75TcHLT6/73MpMuNTEdRJNHe6
         LsgwteClfQuGvKpbaYTt6rnaOwuaTazCa4gjPHsC2qu90wzTgCPgcAWQc3oTViDLiwwR
         8SK2tsHp6pz6ci7VoqApoQVOqtMW8E4aLhjyWYURG4CPXLySNn9dxRe5Kj79FC7OxCBL
         KN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782447370; x=1783052170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMmwNrakZAtbh+fQgTSdnTVL0aJTHyvxqYcj7OIP4/4=;
        b=pes6O5NCe4wPu17KhmQWVirdRpTblfX9tRBrqAMLhH7HtJbNF2itcf2MkGQCf/d3Bw
         nbMWTHwGBYWmsCfQ75pr1fMGBVyBXT1e+LeRxFLzMw8hCRpwLPprYCyfR99BaxJX6Mf6
         hgHFqrPzy5V3Cf9Y/XtzvXpJVk0wLzE59qLKksJqQiR6WaQGziasve9JCOOU501u4gpS
         wvw7QqC8pn5lWzBNyUe1lAXneWJOuSCpmic0yLEvJdHa3HS6onHZkAx1qEoE4D0ubOzo
         rKdeGNuxqFKyP0Rpd22JdHmI+khQdqYaln6cs0aYriI0I3BLvpDXSmEzBiVFuNcz438P
         YxGw==
X-Forwarded-Encrypted: i=1; AHgh+RoVLk9WYx4djp/jmocS50rSmrq5oyP4ODRpSrJY2T5KUYfCQFdujbENZVJ5dtUaYqMOChNwQO58715meLbw@vger.kernel.org
X-Gm-Message-State: AOJu0YzWdLxZNTAiKY/YTZOsXq1lvVZ+rvFyYLWDiKVFxGAnbgA6BX4J
	35SP2Ny+kpQKdXLuzPfHGM1hdfnqyyFq6hJzwMib4pLTJhYDGG+ILN82ou4EMGU9T1/yLz0aHuj
	IZGNpIKE1MTDqjjHNdeTPBNlzYwUHDVMaQ1TJijwhprhsjbRKOA0OF+iq3ztVsWnQJX9e8jKgO7
	HS
X-Gm-Gg: AfdE7cmjuAvF/zu7rWOem4TDnTzyX4YJey0iAm1ELKDg7jZxU7PR2bnnbbR/hWpvrHq
	4mjVcy3/A9LhtJoFXZ9n0wkY5Pj+7JVWkcjMijTlFYfJDV8P4hQ5FJ5j6hIMUyOcghXND0Prmd0
	kV9wbmKMckqx8pCRUMH+aItEBSeozoM6bN4LC16+J3ysVklTEcYZUmxxrtEnDvaKP5RN11s1f63
	xKlrzx4KBDnuNdV9j5lyocO4I71b2jtwzlt9AAY696HGPg9BfRyj9DM2fui6bybzI53wfSBbepf
	Cq0S7kKp7e5WcEZH1aYA21rYytNQ5ycB6vErorjheoEZlADLpJl8SFC6W9Rmcd8ECFHFq+8OjC2
	WBZb3zlPsnTb8YPzWQOi6W8l+S846OjiCNF+kLdVfjbY=
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b619 with SMTP id 5a478bee46e88-30c9f31c303mr424897eec.12.1782447369600;
        Thu, 25 Jun 2026 21:16:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b619 with SMTP id 5a478bee46e88-30c9f31c303mr424875eec.12.1782447369035;
        Thu, 25 Jun 2026 21:16:09 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm13065050eec.5.2026.06.25.21.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 21:16:08 -0700 (PDT)
Message-ID: <a8a2c394-666c-4294-9eb1-911564a32fc7@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 09:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Add PCIe PHY and controller
 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-eliza_dt-v1-1-7bb72b75fc5b@oss.qualcomm.com>
 <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <rnwgxeuz6t6cpbcrmcggqtzsfjnur6kmkttgymp6cbglzjva5v@q4cyoq62p3yp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAzMCBTYWx0ZWRfX72KzCsA96agw
 b9xqRMPs8hvNVJQG7gD1gNxmbwb5pVYKvw6X1MAiu5BfBUl1l96J18DinAw7CBRY1IpACWFj2MV
 UD9WEXPe2wYcLRjPn07jdGJ8vb3x97HQp/Nq0JxgTrC4LB/RolKnezqW2JsKuc7JQk070nmtgKZ
 rHZmsrciQLO1pYdFF44/xMzLtsoa8Ltiix4NoglV2pcPp0COFFHn0oM303/UXj+7ZSz76gy2VTb
 hsxn0gFd9qzKXyWSb06lzy1EcJPHdPbQXEvu6klMYawiOP3Jq4sGRIhDduX3BVQXEA+c9VG+edg
 43gRhfDg7sWrg1hdwB5lxc3O8hwpCmvgSu3i0gGndrIcxDsh3xiLV/KUoKUocDd1QK1PpwbDJVc
 ZPg13zHnsoNxKif0Pg7w5ZgFTcmncX+Xm6HbFBa7hEgyJlgwJN+UsCqV2Ei3fDnDvsCZaPtxtTN
 T5MyNcpx8e/gfxKi50A==
X-Proofpoint-ORIG-GUID: FC6Z5BX8D8hLcJDxUS5HiavqsHAESzUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAzMCBTYWx0ZWRfX+2Uc6hcIa1kM
 I0L9udWVbUg9/s5aD3Xqt1tjyRVV8S6XA0gMHwAZ/R5dBnryTrbv09kODquCalVj+j1uEsNRppQ
 4UomzBzm8Ix88RuSnAqa5SuDtr2dhrQ=
X-Authority-Analysis: v=2.4 cv=daqwG3Xe c=1 sm=1 tr=0 ts=6a3dfd0a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SQ51kRXigZCXnAXuiy8A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: FC6Z5BX8D8hLcJDxUS5HiavqsHAESzUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260030
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114588-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 021EE6CA151



On 6/25/2026 3:42 PM, Abel Vesa wrote:
> On 26-06-10 17:40:09, Krishna Chaitanya Chundru wrote:
>> Eliza supports two PCIe instances: one 8GT/s x1 (PCIe0) and one 8GT/s x2
>> (PCIe1). Add PCIe controller and PHY nodes for both instances, and update
>> the GCC clock references to use the newly added PHY nodes instead of
>> placeholder zeros.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>> This patch depends on https://lore.kernel.org/all/20260608-eliza-v3-0-9bdeb7434b28@oss.qualcomm.com/
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 359 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 357 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 7e97361a5dc5..2a51da62270d 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -610,8 +610,8 @@ gcc: clock-controller@100000 {
>>  
>>  			clocks = <&bi_tcxo_div2>,
>>  				 <&sleep_clk>,
>> -				 <0>,
>> -				 <0>,
>> +				 <&pcie0_phy>,
>> +				 <&pcie1_phy>,
>>  				 <&ufs_mem_phy 0>,
>>  				 <&ufs_mem_phy 1>,
>>  				 <&ufs_mem_phy 2>,
>> @@ -716,6 +716,361 @@ mmss_noc: interconnect@1780000 {
>>  			#interconnect-cells = <2>;
>>  		};
>>  
>> +		pcie0: pcie@1c00000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
>> +			reg = <0 0x01c00000 0 0x3000>,
>> +			      <0 0x40000000 0 0xf1d>,
>> +			      <0 0x40000f20 0 0xa8>,
>> +			      <0 0x40001000 0 0x1000>,
>> +			      <0 0x40100000 0 0x100000>,
>> +			      <0 0x01c03000 0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
>> +				 <0x02000000 0 0x40300000 0 0x40300000 0 0x3d00000>;
>> +
>> +			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
>> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "ddrss_sf_tbu",
>> +				      "noc_aggr",
>> +				      "cnoc_sf_axi";
>> +
>> +			resets = <&gcc GCC_PCIE_0_BCR>,
>> +				 <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
>> +			reset-names = "pci",
>> +				      "link_down";
>> +
>> +			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			power-domains = <&gcc GCC_PCIE_0_GDSC>;
>> +
>> +			operating-points-v2 = <&pcie0_opp_table>;
>> +
>> +			iommu-map = <0 &apps_smmu 0x1480 0x1>,
>> +				    <0x100 &apps_smmu 0x1481 0x1>;
>> +
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			#interrupt-cells = <1>;
>> +
>> +			linux,pci-domain = <0>;
>> +			num-lanes = <1>;
>> +			bus-range = <0 0xff>;
>> +
>> +			dma-coherent;
>> +
> No pinctrl states?
>
>> +
>> +		pcie1: pcie@1c08000 {
>> +			device_type = "pci";
>> +			compatible = "qcom,eliza-pcie", "qcom,pcie-sm8550";
>> +			reg = <0 0x01c08000 0 0x3000>,
>> +			      <0 0x44000000 0 0xf1d>,
>> +			      <0 0x44000f20 0 0xa8>,
>> +			      <0 0x44001000 0 0x1000>,
>> +			      <0 0x44100000 0 0x100000>,
>> +			      <0 0x01c0b000 0 0x1000>;
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0 0x00000000 0 0x44200000 0 0x100000>,
>> +				 <0x02000000 0 0x44300000 0 0x44300000 0 0x3d00000>;
>> +
>> +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7",
>> +					  "global";
>> +
>> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
>> +				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "ddrss_sf_tbu",
>> +				      "noc_aggr",
>> +				      "cnoc_sf_axi";
>> +
>> +			resets = <&gcc GCC_PCIE_1_BCR>,
>> +				 <&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
>> +			reset-names = "pci",
>> +				      "link_down";
>> +
>> +			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
>> +			interconnect-names = "pcie-mem",
>> +					     "cpu-pcie";
>> +
>> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>> +
>> +			operating-points-v2 = <&pcie1_opp_table>;
>> +
>> +			iommu-map = <0 &apps_smmu 0x1400 0x1>,
>> +				    <0x100 &apps_smmu 0x1401 0x1>;
>> +
>> +			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			#interrupt-cells = <1>;
>> +
>> +			linux,pci-domain = <1>;
>> +			num-lanes = <2>;
>> +			bus-range = <0 0xff>;
>> +
>> +			dma-coherent;
> No pinctrl states?
As we are adding perst & wake gpio's in board specific file, it is better to
add the pincntrl also
there only.

- Krishna Chaitanya.

