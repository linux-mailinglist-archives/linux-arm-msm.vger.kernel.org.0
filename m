Return-Path: <linux-arm-msm+bounces-108481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGElBtxODGpIeQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:51:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE01D57E0CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D72A0320A9EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D964963B7;
	Tue, 19 May 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1vnyH5l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGJSueq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E08492513
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190025; cv=none; b=PBaY9DZ8uVJl3OJ3LspftRRPsXhqzCTSyZGRZSIjpj7t15eTjR8L6H/wJUHsaRImwDekY0P/outj7mOod1SbMjMKcOUkgMO9EModV7qqUw1YniIi42birK7FTJBwSwBkQhoZt4EXy3mYHTkGz+ZKpSRjG3YznY2p7MSkvUcEqlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190025; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bakwAtWDCj4CiXLcPA/UGlClBozMhgtwEFpbAk2tcPXpoJGT3oMuvDRP+rpgF7ncr9X/wS7N4PVluEq2fvgx8O8+e4OoEGqdj8Mt8Gx7XiBgx1Q1K0CYulxISXJCi7j1F0AN+Pq13dIC8bpNM0LgFKZun9g9Ohzfr9LdI7Bzh20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1vnyH5l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGJSueq7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA34Md1392941
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=B1vnyH5lZUaKTktI
	OsK7jciedikezrLVK6M0pjKp/Vv89oWe/gvR4AFlGEVwhOXrJMtCTOZuuoAne8U7
	unQFnCu7i6W7n91d/H6oUIrs98MY2xQIMfEZY8D/jvDCnlNvjCF34NiFNhC+sYi3
	wkjs9nahzUDnS+RejxcVK6lOQGrcFbxmsBXlcBc52s5Wb9yDr7WNXCDwE/TpMv9x
	5lpUWTAzwZD4x78WMqPjhjHSXjvfnEj/jqjpQ2CMdKGwRZCr21q2wSnjRvlqyWEa
	cCZ4OsfDA2vD8dxZ2vqvx3udic2ZOR+Xf7TNWkMaeW0njzV/Qe74ykYNR5LqTfMz
	/Lm22A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns48adu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e62562b6aso11479041cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190021; x=1779794821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=eGJSueq7GApwj1RAPjPMkeoOtgYM7L9IIfkLFaZ/L8baOUZjaPE4gf9BT0XM5AAl39
         CON4fEn5ZYKdNaZneh4fZ3RIXRTNKQxBkqPBh2eaZhhjb0iKqjVPYPpdyi6vggESv8t8
         FFQABBIb063D8mlRhmJgK6x5DKSXbWOlFq/9JjfWWnN/lw4NqUeRc7imSpeh5889HsLs
         JxKM40K1l+6z2bfZ3oK+jU+VfKsG4jTATyCJcK/8eHVjpqEEJzcoRhgxlonqsdNeDiw1
         XvpUDhP+3/LG7PqjDD/eDv0X27z2foOxj8t59XQ8UiZWYJ+9R7MZDcbxF+QipQnc8zQ5
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190021; x=1779794821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=pPw0NN5DcW5bvblpuwNSu+Erhw6MHXiX/fEH/oz6QQlNKMGXN2iVkWhPSwkO4/rJ3q
         evG6ohhYh9U2tHczfkP69PDIi5bjExlkJcYlUpEu3ZDYQ9PNflw7zFyysolJAOsSLzu0
         0iM+dYyqqn0KSx16PLYVa0Uy1CCB2EgANTI2t6GdURNyoEPe3UDHVqN7Bj6sGwW5yqoH
         CwR4JYE5/eWemOm+GFHGIB7VmlN6kEAN84l4WXLi8GdxRfgKdpybK9PitYmCjONxXFKn
         PoB78Z9zxOlDTILOEb1WG4zqY9t7SjCiQcNXSe1/H+d/4lKNdOEAUwoYNOjzmQxs2IbR
         /frw==
X-Gm-Message-State: AOJu0YztGwZJ1XXO2qUMy28ucmK13RhmL1zE953F1xuMVg8Cr+3JPT0x
	VaYKQKS5EdWdrDHjkMLcWibHuWDNwHc6EAdfby7kFVqE75oif4W+n6ATdfrop5E9TMm1YLgcsPd
	fpwWvHxRN4R9V5+WST95jYW2BHechfkfApWjsmIv9bUICbkG1WfHYQdep66Af62Is8NVM
X-Gm-Gg: Acq92OHxdDzJ3+RIz/iBbFOOSM7NdtT/Cs3ydqerjBj6KfWut5aSoQzEMnWE4DUTL4N
	Le9y3rxt9r8ZWqjYBB1v7u9JhvewaeSQklxZieeAQM27NFjTJ5obx+ZS8Rx4SeaX5MEVbenBPZS
	SnldWHY96P7g4gT5hxElg5uOg95GeWVQbiwRVANfb9I+dSRc6nZBfiFigG0ycPRbRA9/vAHmn4P
	Hlc5xpSkaKIOviN5woMxwlg1MophUqxLSpuTY58OLqTnVnYWk/mMD/KJ4galMQEERQPsFshnx8u
	gBl17DkxstxEaGPVfGmgK6z07sQBkABPrxS0ePAS5T85V9lKpvbhrYkqvPfMckoIrLIm9W3dgH8
	TqPH49YgEbcZlxFXlpM+62BBZ2kdzVJYKCa7RhwxW6vCI2GEJ3AMfq9yKsESgeGgt01pR6z/j/1
	zyaIA=
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643601cf.0.1779190021399;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:50f:bea5:52a with SMTP id d75a77b69052e-51659e99e40mr182643371cf.0.1779190021037;
        Tue, 19 May 2026 04:27:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd1bc9sm703044966b.9.2026.05.19.04.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:00 -0700 (PDT)
Message-ID: <a9a43d35-6fa5-4a61-b9be-3c283080357f@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:26:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: pm4125: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-3-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX7kgXs3CigjBR
 TgLop4jdKFwkT3IKMwvzhDuKgvPM2oYOL2oFsDdwoUw519vezX5Xttql0o8tn4kwxtOP5iFFhlS
 +fTeugBBAqXEIExUaiOIAYkudjMGLvnVEO9AUPHKdPGwHIj3O2V+7CuacgXDod9abSImSXLgZ7y
 YemeM+31/G3oRnjIR4gJfbb9w/oDalyg7fpW61lhf+6XlhbzRjTT6HlVkC4C63DxHrFnBU02sPq
 5cMjqx2O5aermKiIOGqoUaKa9zi6StNfXqS6HnfzR6ibL042Mege3KoQejWVBcXtNongjQxcwZo
 VY6odKGOL66yrNzV2398SJvIXTWpnGtR9iAvtYJEWNrN7A2tgSxytSH0yIMpdqW0gVmFp59lUxw
 atdzLmZf4xxZnlb95u1yQW2G8j9Wu9vuBqFieZJSQo2S8mw1+bCoyLVes0qwqJYoxFtod8EY7/i
 osajT9vAb1QUMnTUr6w==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c4905 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: MISgLw537h84t-99rChkXUIIXKT7W3Pt
X-Proofpoint-ORIG-GUID: MISgLw537h84t-99rChkXUIIXKT7W3Pt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108481-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CE01D57E0CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

