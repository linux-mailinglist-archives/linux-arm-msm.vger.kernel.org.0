Return-Path: <linux-arm-msm+bounces-116190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AP5CBF9jR2o/XgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:23:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842C6FF80B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 09:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oREh7p23;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IDrjyGfN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116190-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116190-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AB0E303FDEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 07:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E518D33A005;
	Fri,  3 Jul 2026 07:19:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D14339714
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 07:19:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063176; cv=none; b=ZFVJ+OlTU8V07gryDrqtULBippHndCYtKfzhZYUPdKoLz3E8+oj6LzoEqNjxL6fsG1ihZ5K9oWf6lpxVaoHf8NkKvY/mtQACJAkkEm9XXRYS2mms1WsTfNEnhaCiCM5QTDoG4AL02hA+6UJjgdcCwp4prTL93h/n0+IBNRyYIXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063176; c=relaxed/simple;
	bh=1BCxRF2o+/JRgWZS9sS+EH8vOIpCuHx3ZGtchgE5LWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IpNnUndv8t+K5ZUFkyzu75IMt9AdI7le+lfB9NZJsH07niXLk6P4pQJdiNdvAqQVX/WvSrT+W+Fzj1UkxCsYQE74kmgdiqt83AU0yF41XWbYDperZ1sV42N6LiClvk39QF3Akt5qBRdQ/QnvUP30btLRxTKoUdckEbRA6u6ksZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oREh7p23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IDrjyGfN; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rbPp3129031
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 07:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=; b=oREh7p23boKSEvoe
	HGtqMiOS3JkJZFu6pokW1nlogxvXspqos5SnhWGkEksNy2C1Cq0T0zyhdKE/p0sF
	fc2wW35VfduRT2+DUDlVCZtEytpIVzguM7TQgZczpxmr1TwexG0dR1iiGK2R+J1Q
	kkuEUt7Kx6fWXja5qUIw5G14qWGUwKmtmUNSLzo9oxecBkOlv9vTgMRNn8Yh5P/z
	RBLdcCFcq35Wf+kTkySrrR6G+xLKJZu7RiWgexskAQakgNawyIEgNFRbLEynfs1W
	ye6unbAW8KBNQsDFrYdVPHQ34ddiQ42ss1FbHJpKMHhVoKD28st6xxR1tadtsoKu
	GQ8Upg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc4dht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:19:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so1990731cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 00:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063174; x=1783667974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=IDrjyGfNQ1IRfSz/qxOs4nlsh9MRk0vAjlA04Bu7Yicd/hcW/nUgYKzqByOop3f8Dw
         hHWT402b2Sqlxgbm0sqDOsrtZrpQNbP9lpG6J0gol0aA73APftqMBB1xUP9cLsxik5Qe
         mDTksTnZGuzTipeQL6oimARta2KbyNn5uCki5ZcvH5Sb7WDpi7ITQHHCZfATBg26HY5H
         ZxR7AEugAyY2eIHVlyrLyO67azmVl++4Q3nLntKphUx8P7uhOsOiIG69mLKkBuP/f+p3
         JhxCuxuCoWa+fvsWXEtzXd4KrownSUf4POsaZOJb2eF4DAl471WcgBfPxE/Vyz3fqF50
         AN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063174; x=1783667974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8xvpK1OvpXpCw+B9QtZmezDI8RLmkaasieIGKWqZbk=;
        b=UPu48MI5lpvS9YAFgiSXT/9zJ8qGgHjyYr/nZFjTXks4EuyDdvO3WyGcREUNrJY1Bz
         kEt/iEgbmOUU8f/dyq3QAN9uCLqDtNPua4/jLeeFc5F+c6IsExxjlc16IvlMPDOJprWS
         EXcRsSWnaKXHO0lBkA8mKp9aOxmyD5Lyj8Y/PfHMMKWy7OpD/Mb/toCG7QPZW02gTSMo
         7Av7O4grjjw7h21Oq4r90SOGOyWoTvqz2tWJW4Jd+cnp5cTlOtCH9Hnw/4IIZO/tQ9wQ
         QPN2j2yxVjRH5rVb+Iwmd6NAnWkXjz4H1twoD/YnAzARJZP8I1o//co+TCA6M8bBHgqt
         Pn4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pErZ3SdBv4cfolaN/iGBMgPXEH8f/hUEOrokLPdFH1jg9NFcKFFgDZyI01V3C0CLziRXy4HqTWYaDMYiB@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMbQsvc5dG1+2Dod+2HP2kOoo3pdqB5DbC4a9U/jRJuXpd8Hb
	vYCIPYUINwDwX7dBmYiPws9/zE9L+IhMIND4ZZ8pPmEA2GSSKlrKPDLRn0CrGh5r+9IYV3yXlhv
	s5dxZKanwmIcwdoelILCcwQNkT348q5Sr9Hd+mFoKTy4i/1m6dHbEozY2gvUJ2jBkxUci
X-Gm-Gg: AfdE7cndEadmiGn+C0D/BQhwyo5sb9fUbwllWdioA0/NuwqwkgBWjOnEO5sXqqJkYvf
	TA6QyBgSQnmRQxNq8HoLtmHh6MiMJ6OnhHT4gcfeO4BassSQboAR+FUTiBhlu/ss21Zp6JcXDjw
	DgkaqoNTDa2QQObK95Qsy0Gig53mDzzOflctytq5teEFvqa30KTsixNdjxAxC0s1rwfxhBYa8O0
	chNSoNcAUXQT9S3VmTYN+KhH/oVdtY2LkbjwI+bQFWnYADOsNLdDiJ5Tt1PmJSE4DVHjw40BZDp
	quwfbnQy4/SzW7nf4ALJS2lREdtWpCjgv79KGrKvtw19WcPt4AsHOa0mgmysKFwXrKDEMMQGGwJ
	CPt9DH86w0hpgcXU6KB5p+NqSYLztwKeE1qw=
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225771cf.1.1783063173866;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:51a:88bd:95a0 with SMTP id d75a77b69052e-51c26a41ddemr93225471cf.1.1783063173438;
        Fri, 03 Jul 2026 00:19:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm236606866b.4.2026.07.03.00.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:19:32 -0700 (PDT)
Message-ID: <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC GDSC
 *wait_val values
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lC24pVUyZHd-V__FC8HFZnYVLy0tXANN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX8CmLdWEATv1o
 Aoa4SaJcZoMSoX+soX4VcxPHjN+9ArqQw5Iy3pL6RpGED7ELjaXYOOaY4FNbCDgnBVqnp8c1VPC
 RxypRXwIyz2pWHyoSRUkACGEqF1P0CvkTkKlKhTEUWpj71SGbbys6ln83/EYaYn/XafXvyj/rZI
 Py2x9ThTD9Avf5WrsfydUCifXeJdskBqWMmNXtjXjwLC7i50Xom6V0ks/5hC/xP9jUguNSb1OWr
 DkZ/r6drrKQowcqwjMLk1wAzUATEYZkkRfyjhHlGzf17rFYd1bcAVfKOMiWDggc2IN4wjtNF+tE
 Ft4cjZr4iFzgPLFhF6sN5clKsKJcG3/ZbF3mZJ5PrtswvY9y1VZ1HrIBo9b6MMT2Y98urYzjqm6
 ipZNOmhal0dSnHcunCIF+2s6PExyefFo6T5k1T189C0ttaLnKIoclDNShOk7HXH9cusJ/MIYsgn
 4JgTB1Ttk60aqaPxSxQ==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a476286 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-A7SvAB7cpwXWzMQEzkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lC24pVUyZHd-V__FC8HFZnYVLy0tXANN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX9Tejx20qJqD2
 r/NShMFFKEbAjM73OzjY2yWopH7aGnb3XglkZkCecTUqZ6pS9AzoBqOIj5BphjII0Dp+zVdGbcR
 xuIFPicJCkWenZGgTMAdhnzEvRgB3uE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030068
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116190-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 8842C6FF80B

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
> hardware default values. Incorrect settings can cause the GDSC FSM to
> stuck, leading to power on/off failures.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

