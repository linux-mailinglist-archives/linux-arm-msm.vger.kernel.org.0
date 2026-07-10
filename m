Return-Path: <linux-arm-msm+bounces-118301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pmEOEUz3UGql9AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:44:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E5773B606
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:44:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="bo2UR+/H";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iC7oRyNS;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118301-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118301-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 627433014A6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3033429814;
	Fri, 10 Jul 2026 13:44:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8A54229A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:44:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691078; cv=none; b=dkV9Vw3KX6R5Imi7IvuUgHvaqWN6l9O77Jaxci2Lv3WSHdXZPZQl5AJ2GsBcoUSNpaTqRfyfU5R2OgOUFddPIG/qjouFO+1EwQfAMe0D0DBeI1D4qf65MUIb7Vka5Z8uQhKqkEBJ6MbOOsy4S85pLNsDsJQiT4xwo3xNnaPpKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691078; c=relaxed/simple;
	bh=0mz3qJv0BDahOMHl4Qms0ZQnz0C2OdkzNWbTMJy9x1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdebjbEK8Bn2PFfPVxi8pH9xOPml9fWDP/yXC04EMAgIYj638TPWsAOfvYOsLWlEsJqriFbl5uKTINP4fW0HmHIkmsL2kb1lAcDFLfcFBymsaNnrFbpzk8GBhsARtD47zKOxNeTIwJHt2I/nZaClMCgYCpQ0fg8OkkNlumZBomQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bo2UR+/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iC7oRyNS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6PdO871571
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=; b=bo2UR+/HPVjPOrD/
	fSVhw+Lz0XugpoOGYKugMdE89cXqjG49tK76ooDKuCz+kHyV7g18+NJdeHDGzP6d
	PTLTVKe4+vbIaTyzNbfISQsX3wrHehOlnxqMoMwCvETKwr8GgAn5J0c2Shj291Mx
	AnZ9H2dDDeUF8saWiDNqay/vCdZrPV2ioZEPN1v2q7RrUj8G7QNG2bkmStpL9la0
	Ft2PjJdPSSF2FgGSqqyyojeCLvKDC1VdAZDuQnc0Yp1JT8b+AxIs+VAunY5lKkgz
	6I59jdEsrRCnVl3cWBhOuW7zjbt/+ZnlvPu1Da0FJvKNgy1Zyk3wKYYXevd22vJJ
	xnop8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8nyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:44:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2849246d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691075; x=1784295875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=iC7oRyNSB04xyN2lusIc1uSxgNo07FlvQhOCChvl6gB624r4xGb84vq0i0zA64ZIeD
         Si66Vidg5zmBB4mCcwqwvbcGKTiRNOOX08/PW4zdLpPux6YXseXwsLTdN93Jm4kDaX1M
         LKtpuToulJZqC2k2SBybZRoEGwvIzFc/BHraeKrE2Il1UtPBamNND487YH3bIPaTWpx0
         tHXEOAqYUVEi/lQ+kYhQtMmlI99JAyZzWJALI1+Auem8qMco1IsjXFQYDy7F5RxRhFPA
         EF+imCMolEuK5xBouDn8oHER2ywBf3SsyigH8+ezH446UCp3M7HUt5fOZKN6h23b0I5I
         liaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691075; x=1784295875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BajnQZ9UnlDgGNW46b/qmQ3nKKqo2dqOPhzq4QZBTBo=;
        b=QJ+j+EQbwGFBHKmmY5+GsaZeyhAKmQ+FQ7SuNFXEN+9IIy2W6oh0exXVu2MT2I3ao6
         6Q+NJG0EwvIaYoPcscb7JoONylAeXSOBH42z1/emarVrYLLEtjsnrawFpU5h00/tKmp5
         OPW8sKvJehjEbtfakqmPwPFsU4Lpewiy/+z+GZxVMXvHQqHFPCOAab4JPya3bnbcaNC+
         u+GxK8bVxrYD+/PwEFEZqnxIoqQzXhe5FHMi7raPjiWtoBwIwn0zElChogE135+FKnlU
         5SWVZyouEWjW8qlKjtzrKFrW29k2886aj8D/5a/Q+DwKk81tk1HTdXQ/PcU7pag2ZlRk
         9Mng==
X-Forwarded-Encrypted: i=1; AHgh+Row/257P0hWbYNNrfUr5GCUVeJxSWJCnmSBKKBD1aYFHnOoTJJlnahKmoOqB9TcO4OGSk+yY1KeH5eMmTqu@vger.kernel.org
X-Gm-Message-State: AOJu0YwppRlcesCsKmsNumVMg1yvQeLOvLuqmgKqOGU67fUZqqdmF3In
	XP5zwKb4qHM7x5oN7SIyIykImDxnaMsov4SYdXkZRnpHVEBYN6Gl7jDFSCdGSJsvs/rGOZrTf0I
	qloE6MqROloazGIXXgyU9cJX+oVQ9XKARM2BIiD1kM6l77VEA6YqtohyCMosOnagqtLdR
X-Gm-Gg: AfdE7cmofHkhrNoMSReHFWLUBedTGBv93g6t/PFU+fLzMzjvhGGwVkwKnE5NscsQNIM
	YQjF4TkWzR+N+jXlDtm1xFkpLJjQsNcLZvLCLg80bnFwOXSbdI/Lqxi7f9qA9GdjGvTr6Fb0Er/
	yA0/7x8YaGu788pwMEuRwYxplxbLAODZQ8K/Vv2KE/Pl56sT3ZmxedDaQ283yYGo0uoQauhrjkj
	hN/5ntyeaCUHu3u68lIzHp8h9KAgE2e/XuMQSLTqQDB0Sakvc69W4zC0GiSWFnnKB0JFbfqmrq+
	i5rGAag0xKvW8pqSetUO0ffjpPwdcbiJyxnL07VsQmJSZtete5KXCJAoppFlC+ZWuVJIB7gapT2
	xzxXWbAm4QTUE8d39ZGEdJYc56KR/8NSjpA8=
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739656d6.6.1783691075631;
        Fri, 10 Jul 2026 06:44:35 -0700 (PDT)
X-Received: by 2002:a05:6214:1d0c:b0:8fd:80cc:e9ad with SMTP id 6a1803df08f44-8fec7355228mr108739326d6.6.1783691074996;
        Fri, 10 Jul 2026 06:44:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69acd3e06d6sm3254661a12.26.2026.07.10.06.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:44:33 -0700 (PDT)
Message-ID: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:44:29 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: upH-xwrUlalRuLyaEVlrKBoz2tWVexjj
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50f744 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=75QiWgRGdHY30H_rKSEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX3aeHkSIZ+w8y
 F+Xl6/F/C6iin1iAAhK6m7YAGouQAA0EK+k/OWrKF6aRbVXLHkAKdwjeiD03EDU1oAbRIqF5/sD
 YElLLd8v69LK+915ZwaG2fkjVXjZT18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX3vxE6o8pjbZA
 PBVwk9v2lXENllz87S2o8flHa+58pQ2/tsim14alt8ym2N5ASpISIba6HBksIzy35uRxMcy4dvA
 Rb4yciV9teBGuQSVMiG5H5RA+wP36aGN3H7YpemDRY8CqI+4gUNcwlZgtEkuRhKTinoSSZ6kRi2
 C8ifs+lz6R6mwP2CpGBQ3cKhl+aklqKi1vwHVPzb6avaQfWKSOMivZh46uxYmDXYEW8/woSb4Tr
 T+b6bsPOVqKXG3ph2uuv9x336NkhXcp953Y41jAbO4liw1YtuT2ckd2DVYFal1DFyjchFAtG4z7
 TB5C+WX1HYqNZmMaGDBYC4gobx3HaTlgCdN/JTA3ExtpLVaWWdDqXioR3/vAlUe1Z77iS5CY8K8
 3yV7lKFx9fD0my20YNiZIHQ16j5Zb+BmshtB9YinH9UKczoDs2Z5WSfd+WHCrGcbOAJZ/3xH7mT
 E1V7FmVC9FikyGNzCFg==
X-Proofpoint-GUID: upH-xwrUlalRuLyaEVlrKBoz2tWVexjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118301-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akoskovich@pm.me,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: C5E5773B606

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OSC L3 Cache controller node.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

I'd suggest to squash this series into 1 big patch, without patch
3 applied the OSM driver will engage and perform sync_state (with
0 requests, so it will vote for 0/lowest) and the system
performance will be tragic

Konrad

