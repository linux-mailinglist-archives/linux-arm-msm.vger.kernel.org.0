Return-Path: <linux-arm-msm+bounces-103884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOKLB2wU52nL3QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103884-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:08:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AED52436B95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 662973025736
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 06:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CCFC37F734;
	Tue, 21 Apr 2026 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhQzvH9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYwoqFl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195537F011
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776751576; cv=none; b=VUMzPxfdXhbzNG3rHcYg6Gz95tH/9fXYM7O7yz0p/SUSe3Riiowbr2F/zs3wlCtjvV8kvP6cJFNucRRugJD5SgDzjnmkRgX/P47fejz0P//+3Fyki8PFJedF2bZ2BKn9m8A69uIbZG5d0O4yF8OAKO+OitFeDVGPGEzqWC8zEpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776751576; c=relaxed/simple;
	bh=0ChHJjneCdtwjKLIkSPHeSzmtX7Fdl0q36FnIQ9gTXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqxOrh9Csq2XIW60i2hyA4V+1QSreDDDBXnVGQIJ+EXmT3Zhs5TClj4MtWnGgvmylQn0xThoUuvU1v4TeZU2KmpXs6CBhc9gI2US8eLpmMpRyzaW4c6P4u1pKWmrBA6LToZGuLCOXK1QhN0m98f2dvS0rLtJvwk1yZ6hL1IcJjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhQzvH9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYwoqFl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5bpmt3455442
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=; b=EhQzvH9BLXCA+sro
	HE7OMfeuv3edT7f+p3PdC9vw23JDqfmM22U2ayM/Pzlyj3LUkipwWTabhn2Sy5IQ
	MQYfs8sEl6+yg1jcRlXr2IxY8g2cXrK2eFgeKboztrDn7eT8BlpAt9r2pp9Qm3qv
	7drDyAVAJlyQlLyxnAC/E4eAjkEGQuCx9s6Fiq6l69VeK3ntvXp9/O0q1BR2o7jc
	OsWmyAcXMxK7r7rZYSb4NehRKayE7pTAlrg0xHVoUs0HK+QkMDQHlNJv5g02r+lf
	OjnWoDCANF0AjO/svREY+KVv6d3k35jDzSbUM7HZGeOHK+o73HwsqjtjHzKmw+w6
	Y/g9xA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjvjyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 06:06:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so2089868b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 23:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776751572; x=1777356372; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=;
        b=gYwoqFl2MKC0iJru9WAD2ccLYYTctl8QIq/ULAEieLWeiT3fNcwDAVwhXNL6FFUGAm
         Wbh5TB5jiJz4fpqqN8oJYWttV4G+tQjJOSY4j07FIZwUaZmNt+jCiezifqM7rS4WiRW+
         REsjHBDASzO+KtyVlj5yci0W+6DzlwqTEzI5oRDSmqNFh76o7I0NYHqxkvDAy7HOEC/5
         0E64yLBNEs13BNCDjrTJovolgOR9YV2pNOB3mgnV/cQC8TDiSjXg6mLvlmH45fZJnGUJ
         n+JXw477B369vWpJHofPRZkvObwsJnIaMIgxnhdYIqOMHv5eKclvsT7edRS7ATveKplz
         zRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751572; x=1777356372;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x73AA1IG6HcWfqgG+vCPoGL693vFztSF6NnjQyhqMhA=;
        b=cOHszYqmUO3IMmV4hii7zmY0bC2FwXJFzEM2DBhqGqamP5JsoJ2MUuUa/tez0EHCPV
         7GlZAh5Xw9pyggrPUUrmtXKmwNUtvmDp6O6t7h7Mmco4vBAxQ1EpuQnM/pXbRzoDYYKu
         +qz9IMFSH8KcaUOwQrKtekW51lsmAWuetTp5DgrETF3B4a9rGGzoi2gV+cUgkeDB8FXW
         hYPFYXnvj25KYnQYftHdL5aoZPD/5ywPHhWS4Ihj0tw9XOjJoJy93RUmW1a9v++Ym9IY
         /GOKVmWYRlleb/sYosJiaWjxmAy1F3UkUFCMuRz0+6Io3FtQGdBC1JDnurhlhLXaB5LF
         c60w==
X-Forwarded-Encrypted: i=1; AFNElJ+UNRCuc6fMA49T3dcJLqtWBnaFAMc5TgdhtNv/yYKBNxeeeq5N+wDH3+LECjcZmLgcTADjinrhXF4UQeCf@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTmxLD9lbdZI5RvmicRm5Uf8Fga6OcSR04PgUSyChZezcidKq
	3EgA5OjhjLxAkjRFPFrdIHaaQRtA4y0q5f00rMAocwayjBNWUjzkFI7P0tMaMm/KSDdbES6nwxp
	uUk4MyZPwn2GxhUR9qOgOFt+4d8bF/lDNlwFXQ5V+dR251Ycx+w1UTQPKwqYWuYCkBRLV
X-Gm-Gg: AeBDiessEnpdKfsl3yh+UBt9wGADXGKl6oLqlhExZIqmuyuZbnwWSO/+GaDBO+ka9S5
	FOeKrQqVhUXtgXsrLa1IF2JYvg/kRZCDrEppLMsdWce1R1E6PuQxZJ+EvW273yIqtdkfi8aiF3v
	NswBuT6k511fO5AUQ2qWLQkyZtu8phReF2QAXUzfvaYvkbIs9kq0opfI0m5uIl4ipyko57XWovR
	g1h8edoyLItBOaIoGXsi3AmDFrmF1ZLGlrFhcGx4Zuyf4/z6Fz2cLLWANVqmwOKXOrDw/X0Gt8l
	wjfUPUKPRVzc/q5/JKWQsuodH4lzKhgDLCqWRmuUiXAta9e3Wn3ocGse3cQGs4CF+ilqyP7EzWP
	FDK8WLjUZf/M0SkbKMzkJX9BCIs/mfcD/lsIVRSBjf4zUrYI++a0XLrTnfF1HdOs55cVXWA==
X-Received: by 2002:a05:6a00:4511:b0:82f:7762:3eb2 with SMTP id d2e1a72fcca58-82f8b507fdamr12071095b3a.17.1776751571729;
        Mon, 20 Apr 2026 23:06:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4511:b0:82f:7762:3eb2 with SMTP id d2e1a72fcca58-82f8b507fdamr12071065b3a.17.1776751571216;
        Mon, 20 Apr 2026 23:06:11 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f932dac13sm12018462b3a.35.2026.04.20.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 23:06:10 -0700 (PDT)
Date: Tue, 21 Apr 2026 11:36:02 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/5] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aecTykgnudQGRILA@hu-arakshit-hyd.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-1-ca1129798606@oss.qualcomm.com>
 <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4528374d-8175-4a1c-859f-23ddf2bbef52@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pQiUfztBhLDJ1rQuc_wgMG39JMuTI7-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1NyBTYWx0ZWRfXyw5YqtZoCtlC
 DLzM5MtDw2JVH5XYDLbwTUgz42pA+aKO0fhQr+ROgc4iCPi8QFvQkyVLJRN4l+EQWH7klvSlHgx
 rPQeSgySZ0cAGVrogV2POXT0jmTnE8TFBI2XIha3NN7tsX6X+i/IVC9yWGwKj3LBbuo8KwutvI5
 rj4iiHrF6p3R5QDkUMvt9kSUKbl+Q79Db5lWNNzqsVL0bkfa5Rkt04B4gFw+2R6ZCrxnReD0Pua
 /Lz0iI/R/66oA19tQvmx525FSn+odZhhqvXoxgSqkWj42/aO3WCJIWREADoroDnle685egmihdf
 OoALXrT7A14PWCEWL8/omtl/AU8Ylw6EKMOoU8RsFm4GANeUdz/yXytyUM8MnMDdNDE1CSw9IKR
 DNh4yJn09HF2TW1NnBYTRFi6rCAIlEqj6sNbOJFV5lt7L30LWodu6tJF6CUHX0LFYRV8KfC5PSw
 932XOOIg+Kmo0VAbxIg==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e713d5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XGHNUSocF6D1puBBiEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pQiUfztBhLDJ1rQuc_wgMG39JMuTI7-l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210057
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103884-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AED52436B95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:55:14PM +0530, Harshal Dev wrote:
> 
> 
> On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> > Register optional operation-points-v2 table for ICE device
> > during device probe. Attach the OPP-table with only the ICE
> > core clock. Since, dtbinding is on a trasition phase to include
> > iface clock and clock-names, attaching the opp-table to core clock
> > remains options such that it does not cause probe failures.
> > 
> > Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> > core clock based on the target frequency provided and if a valid
> > OPP-table is registered. Use round_ceil passed to decide on the
> > rounding of the clock freq against OPP-table. Clock scaling is
> > disabled when a valid OPP-table is not registered.
> > 
> > This ensures when an ICE-device specific OPP table is available,
> > use the PM OPP framework to manage frequency scaling and maintain
> > proper power-domain constraints.
> > 
> > Also, ensure to drop the votes in suspend to prevent power/thermal
> > retention. Subsequently restore the frequency in resume from
> > core_clk_freq which stores the last ICE core clock operating frequency.
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/ice.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/soc/qcom/ice.h |  2 ++
> >  2 files changed, 94 insertions(+)
> > 
> > diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> > index bf4ab2d9e5c0360d8fe6135cc35f93b6b09e7a0e..9e869e6abc6300c7608b4d9a18e7f3e80c93f5e7 100644
> > --- a/drivers/soc/qcom/ice.c
> > +++ b/drivers/soc/qcom/ice.c
> > @@ -16,6 +16,7 @@
> 
> [..]
> 
> > @@ -742,6 +800,40 @@ static int qcom_ice_probe(struct platform_device *pdev)
> >  	if (IS_ERR(engine))
> >  		return PTR_ERR(engine);
> >  
> > +	/* qcom_ice_create() may return NULL if scm calls are not available */
> > +	if (!engine)
> > +		return -EOPNOTSUPP;
> > +
> > +	err = devm_pm_opp_set_clkname(&pdev->dev, "core");
> > +	if (err && err != -ENOENT) {
> > +		dev_err(&pdev->dev, "Unable to set core clkname to OPP-table\n");
> > +		return err;
> > +	}
> > +
> > +	/* OPP table is optional */
> > +	err = devm_pm_opp_of_add_table(&pdev->dev);
> > +	if (err && err != -ENODEV) {
> > +		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
> > +		return err;
> > +	}
> > +
> > +	/*
> > +	 * The OPP table is optional. devm_pm_opp_of_add_table() returns
> > +	 * -ENODEV when no OPP table is present in DT, which is not treated
> > +	 * as an error. Therefore, track successful OPP registration only
> > +	 * when the return value is 0.
> > +	 */
> > +	engine->has_opp = (err == 0);
> > +	if (!engine->has_opp)
> > +		dev_info(&pdev->dev, "ICE OPP table is not registered, please update your DT\n");
> > +
> > +	/*
> > +	 * Store the core clock rate for suspend resume cycles,
> > +	 * against OPP aware DVFS operations. core_clk_freq will
> > +	 * have a valid value only for non-legacy bindings.
> > +	 */
> > +	engine->core_clk_freq = clk_get_rate(engine->core_clk);
> > +
> 
> When you are calling 4-5 functions in a function, it's probably time to define another
> function to keep things simple. Maybe qcom_ice_attach_opp_table().
> 
> Also, I still have issues with engine->has_opp = (err == 0), mostly because I don't
> see this style used at other placed in the kernel. I would still suggest that you
> make it simpler, but I won't hard-request it.
> 
> /* The same explanatory comment as before */
> if (err == -ENODEV)
> 	engine->has_opp = false;
>         dev_info(...);
> else
> 	engine->has_opp = true;
> 
> With these optional suggestions, feel free to add:
> 
> Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Thanks for the review.

Regarding the points you mentioned:
At the moment, not much is happening here beyond registering the OPP table and
caching the core clock rate. This is executed once per device probe, and the logic
is fairly localized to the ICE probe path. Because of that, it didn’t feel like its
reusable or demands its own helper.
That said, I do see your point about modularity. If this logic grows further, or if
we end up needing the same sequence elsewhere, I agree it would make sense to factor
it out into a separate function at that time.

Regarding engine->has_opp = (err == 0), I understand your concern.
However, I intend to keep it this way, as it keeps the flow consise avoiding much of
if-else branching and also serves the purpose.

Abhinaba Rakshit

