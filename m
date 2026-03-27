Return-Path: <linux-arm-msm+bounces-100293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDGWKUR3xmnwKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:25:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 354843442BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 73FE23013DE5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FAB3A5423;
	Fri, 27 Mar 2026 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNQhgU31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAyQsqju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33D392829
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774614335; cv=none; b=I84ROKSwm+AOLNsjAcAYK5p0+JfxosHSA3f2iSCym4L1Aht0liDs+E+bp7cCxi6qgBan58OoDVNROzN9NcxbfMv3KgFv+4i9YXelVBvqXXOCK8dPNBLW1HcpzagoR7wuReOC3D0jYGnWQuW2p6SCo2mbU/k9xn5o7YpR2J04cic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774614335; c=relaxed/simple;
	bh=cJYXum6MxylGt6d8OEGYQB6VHofL/77zcDfl09y6BIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUrSr5Qo0DjFWG1C1NcaqWuSG0sQlhupl8T/cfFSGjFsh3n+JseGeVixWhcU9t8Hy7osu5YDLS5l9pBGJQnroBYWjzE1/p9WLvga84dWt+0KHD7pMWxbyqtXmffyESSN+ASgt489BQosb9Ju3HzZtzIGkvAa5wC78oyQ0GbQgRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNQhgU31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAyQsqju; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6w7TV3132239
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=; b=LNQhgU31cE0h27yQ
	tSSoqkdrmG4QU1Ab4SIpzHj8eRrzgxEjiEeZLEWy1FEIadKyEAfZHrAi/SXovz1w
	LRQPOC3Z4eLms/mFGhHVoDjptEFvlxa5L7KwH2UCKOCPP2njPyYFaJ2tW59ahIWT
	976WgL4SiksrCnEz98A/dTu8H6hV+wQyD2dhrKWVf/WbvDuRVNYVSwP5UO38Djsw
	4xwSz9BIXJk83ji9qDntErGczzAUZ+CgocYlvLV4Jxf4qKXf9IJo8XhrfAX+Owce
	IoyENFVc4FXkFYkdXNaLf5/3VlLV+bDK/kJlTeCyWhc9r+Cor7RIQ1U06n0TuFyy
	y8K/7w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s43ebc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:25:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89cbeb95521so5894616d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774614332; x=1775219132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=EAyQsqjuZZib19LtNbivWZflkP32kwWmcH2WGnsXWAFYVxvB7U47889GS4kyrA9NSq
         AWCrZ6cQsrDNvUj1W9oeDh9chYl10wWAAqrZCrXig4GTxSQG66odz4CvkJJ5UQTSWmFG
         yqlxrn/Sv4GZpY98TgKHkNsT3Wtu8QZtPT8sYBU5VkMBboSRwgwB7kb5VCfTQokJxOQz
         P4bAGRZDzBzY7jb89qb0o9JTUV/pdzz+7t0+2wOO6tSs2nEmLvujWhiAj+aLhVPKnu/s
         C4E2+vsvK1BiOBKvHy1cw4w2bgLO/VxfWT0SeGlckOI60/vgVXHMARsmRbQnBNYi4JTC
         f83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774614332; x=1775219132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZJUaWKKLy7fIGvhQ1mOhekag/nz1OSDsdqdjemihQY=;
        b=WnRwHn4FoLI/YcatquFCxeIL3MNruyr3WO9hb5bfA6yJ4srf5ghm6O/gZnBc2msVSN
         7WwlPyoorjxB3znQhWtxQoNEqsauddwfLOSbbJvqKIdSLngaS38UgWKaZ08DUvlgVQGQ
         UpiXDk3woQZpdQ+KvWR70NTEKRZxnKeOB3KqQoe9Tk8H9MAWWPCtcE1DLexRuZFyMrG/
         9copkUCMuC/9TTHiuaz2v7jceCUBV+lp3/qxIKoTqvOU4G8bShELnuhQB3fotvBUzUjs
         hMfgLyLglqUSxAjYuVg6rMn6P9OFTnYEVKAAK8Sdi32tI1QZJaM3vc6KPipN7rPGozvh
         qgHg==
X-Forwarded-Encrypted: i=1; AJvYcCX2yr7yQLUf9ujGy4xHSbaV7MNej3fKi9WtOsWFXistisf0wfhJklBjb3y4Fz6dE91XvuJlld50Iu7yB0BT@vger.kernel.org
X-Gm-Message-State: AOJu0YxyPFl5dTDNh2XOSUv3PRlOTPhJjVRCD8wttFsxR0AMy4GCnR82
	uYdu3b9ILxNGjK9HxlBp+ba3icfFsICKPDT3c0mXO6tqcQt1Abkiha9NW0d8ZlUX2k/srVDjOvz
	tCu1CCEGXdWl0rNnrBxnu6QhKl08bVLcSlo1AuOtnBwMuuWwRU00LFq1phfvzG8bauGjb
X-Gm-Gg: ATEYQzywet91bvGMBiN/L9ilEHv2DsKdmeysd72AST0E3zarMvenmHuyhwh3DUpMuDL
	8qFq20RXwAiVyGCiFJLmPfdHGLXc8s7PAHwxAL8vJY4oLp+cgAres1zGiNEk9gnQcFtyMHHjz67
	Gl/1Bj+N/BJ7djrs2vXRZgNjbGg5+dbAWPSFi7VXN9he4BuRwZPJp8+pyjbm+FbwdI4G5sjXUxF
	KlRTNiM7YIOGKC9bnEafB8iQTiGWLlRWsYen5ipRJmeqDyNVYiBGMIzicr63UJQV+cmCf9I1FM3
	FLI/LfM5fwKZ8slSdM+2nDSyxfNZLrq+EBtlENX9qPt3oMSrxCxqQQb15+ZMjNzj3z7eb+11884
	U0rOUbbnnFmTbLHBNWeWxQt//ut3k+MnMFurlfw9YKT4KLE2GOB4QXDzXhwMDb9/Pq1Due4pJVW
	hD5+c=
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22492376d6.5.1774614332004;
        Fri, 27 Mar 2026 05:25:32 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr22491826d6.5.1774614331461;
        Fri, 27 Mar 2026 05:25:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b200206c3sm245110466b.0.2026.03.27.05.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:25:30 -0700 (PDT)
Message-ID: <de024120-a67c-4f4e-aeb3-29fa26b76678@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:25:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add missing CX power domain
 to GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-0-f14a22c73fe9@oss.qualcomm.com>
 <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-dt-fix-milos-eliza-gcc-power-domains-v1-2-f14a22c73fe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hsjti5FhIjmSDYhwhCxtN2TEuJcjS7K6
X-Proofpoint-GUID: hsjti5FhIjmSDYhwhCxtN2TEuJcjS7K6
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c6773c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hvCAL5AnRklPZhNa95gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NCBTYWx0ZWRfX34xegiE3+PBl
 tqlHlU8C80nB+DsNHq/XKE1bQm6KPXyLRBDyi5HPX4UzRuXiSkJoOPHgSKmAvJDBz3SU1gNP+ba
 nFC9SxCDxakzS8YXDR5isache2//QVj8Mfkyct8n6axUTVJcDUS7k5tD3sLl6Dh+9WJbFbM8cIi
 vghRXKVzTdV3jutBjIH3dgnR63RWaU6mGs9RguoMQiwC5ALjdikg46OrfGqtiAv0RWyolamlLUI
 KMUE7l+mnBAP9Ph2fswiMOoE5KrtktUNvTO3QvWfWsz6Htjoem+aG9PbqpWsCmKUNjOEuk7AZSC
 umk6Qx2x3UFiEjHtr80SRsj99e1YcQ2+oqwTt0GV6T10hVEUsfG1iozGyVFfjIyWa9nZ4lmfkrU
 uD8Ze4VW+L0V/guCfIa9b2QulkZ0PuTe8HXG78mf3BZGQQT2GzJOeIjaJKQFVM78oeVDbD7ArNL
 DQwVl36vqXFfnfacfTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100293-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 354843442BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:13 PM, Abel Vesa wrote:
> Unless CX is declared as the power-domain of GCC, votes (power and
> performance) on the GDSCs it provides will not propagate to the CX,
> which might result in under-voltage conditions.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

