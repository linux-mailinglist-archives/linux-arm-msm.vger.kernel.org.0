Return-Path: <linux-arm-msm+bounces-113127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HnJXIsO8L2qWFQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:50:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4CA684B94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:50:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N48wynWW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Q5H5X8Rn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113127-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113127-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97A04303B58E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990283D090B;
	Mon, 15 Jun 2026 08:46:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B454358399
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:46:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513167; cv=none; b=fEQWxLxeV/Ow2yQH8XypDCoM90U4u+uW0X2yLRgAcQZ9eEquUtJTFLYBwgRTA9SRXKrrxrYt+R7oFGVaFfi2gsHtn8T6YRDT3pcnemLK7W+QfXuG7MdUGOaguFiOOKmHZ3aS9lpQPjVp746ahKl9jOhsvUbplqNV5US1PXsPTu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513167; c=relaxed/simple;
	bh=/O05/RUXDTPoINgeXSSQztmerkf3/d1laEEbbrZivPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6GbKpdIdSYJhI798wKv/MCTwmzQJ7r7loE7yX+5nBsbO8N9Z50pHpAxlU+yPaL0GTJJWAuKXX3GYzKM8fL2McPW0KUtcuyOUw2ABPxmLfeZdLAd3BKmr0VtH10bCtkV/DwrvpdoX5nvTehCf5znFJ2tE5QtRdawb48iUIYn/nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N48wynWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5H5X8Rn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6IsgW3346515
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TQmsqoe9deZs4vwOMpPUgVk6
	RggtnzeexXvCM12GNX8=; b=N48wynWWB2UjZW7DAs120KmX8QCk1JlgW41b5BCN
	AqFz4HYgYHskEveUuXHDleVDHk61XBKUNEij+WPLD2bWLQbXKR9KlXgU/sEOErIa
	O2Y110pBeQ+2Up6c8upo/UcbNdhFOb6IYvPcPQ92h39nEt0r2AX85lsz5wexDW20
	+4JbhUlmzTZXVMGNftODqJwA4HMOi09fD1xAw74RFGvJscnydfPpdwHx5jlocgMd
	TpeWLDATv4WNTvizEHc9rund7ldYUNL5DK23Zks+yEdsx/DtauHaeNWY0CxLiWWy
	hnq1Ymmhm7coLwy0qfuoc7EIRs1R/KhwBJCIokvGxMYgzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0g86ggn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:46:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso6698191eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513165; x=1782117965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=Q5H5X8Rnyjs71X8xhLPgaMC03QiGmpYB2rCIDefYKCjk4QmKYvCXMolualyuycKmpL
         zJmrTz3uLNTsjIrINtOacJ1rRZfy+HRjpV4rQWfgccdX1ZyZu28wJhpqrsUocCAzOZGI
         8eCfFmpcrBls7l8o/pusgCBwk8TqcCbflVWbCfghkW68XVwgnILB9ybApYR3ApRkBkH2
         4xJfNr7UKDZfRoeeWw2ssdzzvBV2LhnJzdJeBSOt9vilrL8Ape2ShrM4eISG22bymvNY
         xBwtOU74OKeFRNc9nrcWpraBR3AraGAViMMMJvhQYGLeJQEzWGD3UavZ4i52U+J67lxM
         pIWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513165; x=1782117965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQmsqoe9deZs4vwOMpPUgVk6RggtnzeexXvCM12GNX8=;
        b=sVPWSNrlabnkkgUlaxk//P2DgXf3IXKC706oJZ+ixlPSI31mMmdV3NiuY92duDce3k
         fe1poPzLmFqnSur1Sxa3WTGePYBolHAgkK6opPH+WAUFkmuusROhctCdPTaJEK2AHYqf
         btSiyNLAt2ob9lUb9D2Ra69An5NNIg5ErXYoypyFLna2y0JpO0WnUq78335e8V6OOcBK
         m7w7+2fy35EM7bK7yMp0dpGBCDyNBeVa/bZILMouT2CFD1UjwrocMv9+0aPhbiCKj60U
         KAbDu5VkhQn0mZJGNoFUdHC5ART1JZG2GBiIpBKf0CSREvq6sbJrgm+fqvuex1sgjYPs
         C0RA==
X-Forwarded-Encrypted: i=1; AFNElJ9tUpNDw7M3gW10Tzizgyi8MEYz7c5Xd1p+904grnIXVzZxbEtpp7ZD+ckF/ytFaq9IbvL1EkC07taJ1wok@vger.kernel.org
X-Gm-Message-State: AOJu0YxIXj/8Qy7CueBCPPhEquScTfDDL8vqYVgua+rqG0DyGELgN3Ff
	Y2gApRr4e3ztG+711Y8dOoozR2jYghDaPvv45FVlke+apY2gcifkIzonSz1OzhAOri/4ZfYZdAs
	7b7TMGbbaFBO4shYzI6WDAc6fEtYPhI68Ap3NGWb7jIGs216b0ITPK0gvthzgsrve0OFZInUYzW
	uq
X-Gm-Gg: Acq92OEO3vX1xafLFHsJDHgmPeLougpjdLkCiCbwJ/wRMI18WohBFMoux1bqw7CWCcB
	f4AP/CGBC+pny8jTtzs3HhHLgc3kqSZZGuuJQLOV8rRx1RvYgd/fxLS1MB/GI6fraOZ8kL55QAY
	NYWxId3v6PLC28UtoMFtjzXsIuDZNcdy49BsXej8uYes+B2yAUFXjmPpnc+uA8TPyXjfzs+9NBW
	nu3z5QECWwEwyCf7vAlw9HpL63IFKp+nCL2TxJQCkliHsxiJjpBTN5exkVgWtWMyUL9HVWf4L1D
	6CFXYxS4CyET2tS836jeJIBlq5G0MfoIKVMD0whDZSUKGYqo7KrjxrHAF0OSs+Bi53hWSUR6ZL5
	ZNzM1nrmkpPnYxiaW5oag1fqxGE675z8STwf3HB1amMJA2pgha7tGyDa50n2bzy6KnpWx
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832582eec.3.1781513164783;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
X-Received: by 2002:a05:7300:2148:b0:304:2e00:5fb5 with SMTP id 5a478bee46e88-3081ff4b72dmr7832552eec.3.1781513164193;
        Mon, 15 Jun 2026 01:46:04 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb8f8b2sm14166142eec.27.2026.06.15.01.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:46:03 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:46:02 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 3/7] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <ai+7ym+qM1GbTO/b@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-3-ded83866c9d9@oss.qualcomm.com>
 <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <747f0319-68e1-4cd7-9dd1-4a675d882f99@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OOoXGyaB c=1 sm=1 tr=0 ts=6a2fbbcd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9x36BgKddDksvwc1ZLQA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: ixNLiSWMkmhAK4ROVPyh7wyc9PO-F4pb
X-Proofpoint-ORIG-GUID: ixNLiSWMkmhAK4ROVPyh7wyc9PO-F4pb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX9xAthadQOkp4
 L5sPGOkYwON/DDQKJvW97lJANdfrf2yHtwrSzAXTC1o1ekiJbEAMzTW0efkgdnwDn9egPFSWN1n
 LQClbCf8H9gqS3Adct3i+ORoy5yeA6UgXF3/U2NUImHTG6pN76u+LUjmhoaP+fkqihaKLOe7Zva
 xySqnFkknMxrAHfN6uEU6brrMEcKBxJ9pemW0b9YNsqOAxR0G5McqDw68qhpI2WaL9BysdHAF5l
 qlU7S9W1QCdsblDSdxTzTirKGiAC8QlDNviUWZt53pW3XuYG1YAnHYtPtyLny6JywIZxj3MX6gr
 yoT1Sjvo0BcmE9DXMeJ1VYCVG+7nTBeCI0XodpsB9eEgWIuoRE4Wd/oNEI11KF6fagnGlmEsV+s
 /ydfxFOE4A3UXlcKACZwKZaH26VLN8jaQ947I0qWdMXsx7prGi/rF5A3W91i/deZkPFUMJN+jbl
 Gt9oSo1c+qskQ4qT1jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MSBTYWx0ZWRfX4zNV1/xwyeyY
 OUfe4rNIDtuWzOkZl2NfYXI8M8S1AN5J7H+VyysU6jLD4Aqr9tuflE/Bdm2gxTWDhEuHVn9HU3w
 Vk2q3AtrtPkqWNrGGWoroRquyCnJQL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,hu-qianyu-lv.qualcomm.com:mid];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED4CA684B94

On Tue, Jun 09, 2026 at 03:02:27PM +0200, Konrad Dybcio wrote:
> On 5/28/26 4:29 AM, Qiang Yu wrote:
> > Replace local clk_branch-based clkref definitions with descriptor-based
> > registration via qcom_clk_ref_probe().
> > 
> > This keeps the glymur driver focused on clock metadata and reuses common
> > runtime logic for regulator handling, enable/disable sequencing, and OF
> > provider wiring.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> 
> You can remove the of.h include. Apart from that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Also, attaching a diff to complete the regulator map. I'm fairly sure
> these are correct, but it never hurts to triple-check.
> 
> You can add:
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> if you squash them together. FYI e.g. the tertiary USB QMPPHY would
> only start every 20 boots or so without this, running on pure luck..
>

Okay, will sqash them and add above tags in next version.

- Qiang Yu
> Konrad
> 
> diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> index e317003398d1..eb4ee8ec9ad7 100644
> --- a/drivers/clk/qcom/tcsrcc-glymur.c
> +++ b/drivers/clk/qcom/tcsrcc-glymur.c
> @@ -21,6 +21,14 @@ static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
>         "vdda-qreftx0-1p2",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
> +       "vdda-refgen4-0p9",
> +       "vdda-refgen4-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt0-0p9",
> +       "vdda-qrefrx0-0p9",
> +};
> +
>  static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
>         "vdda-refgen4-0p9",
>         "vdda-refgen4-1p2",
> @@ -40,6 +48,15 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
>         "vdda-qrefrx2-0p9",
>  };
>  
> +static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
> +       "vdda-refgen2-0p9",
> +       "vdda-refgen2-1p2",
> +       "vdda-qreftx1-0p9",
> +       "vdda-qrefrpt3-0p9",
> +       "vdda-qrefrpt4-0p9",
> +       "vdda-qrefrx4-0p9",
> +};
> +
>  static const struct regmap_config tcsr_cc_glymur_regmap_config = {
>         .reg_bits = 32,
>         .reg_stride = 4,
> @@ -52,6 +69,8 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_EDP_CLKREF_EN] = {
>                 .name = "tcsr_edp_clkref_en",
>                 .offset = 0x60,
> +               .regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
>         },
>         [TCSR_PCIE_1_CLKREF_EN] = {
>                 .name = "tcsr_pcie_1_clkref_en",
> @@ -80,34 +99,50 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
>         [TCSR_USB2_1_CLKREF_EN] = {
>                 .name = "tcsr_usb2_1_clkref_en",
>                 .offset = 0x6c,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_2_CLKREF_EN] = {
>                 .name = "tcsr_usb2_2_clkref_en",
>                 .offset = 0x70,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>         [TCSR_USB2_3_CLKREF_EN] = {
>                 .name = "tcsr_usb2_3_clkref_en",
>                 .offset = 0x74,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB2_4_CLKREF_EN] = {
>                 .name = "tcsr_usb2_4_clkref_en",
>                 .offset = 0x88,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_0_CLKREF_EN] = {
>                 .name = "tcsr_usb3_0_clkref_en",
>                 .offset = 0x64,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB3_1_CLKREF_EN] = {
>                 .name = "tcsr_usb3_1_clkref_en",
>                 .offset = 0x68,
> +               .regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
>         },
>         [TCSR_USB4_1_CLKREF_EN] = {
>                 .name = "tcsr_usb4_1_clkref_en",
>                 .offset = 0x44,
> +               .regulator_names = glymur_tcsr_tx0_rx5_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
>         },
>         [TCSR_USB4_2_CLKREF_EN] = {
>                 .name = "tcsr_usb4_2_clkref_en",
>                 .offset = 0x5c,
> +               .regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
> +               .num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
>         },
>  };
> 

