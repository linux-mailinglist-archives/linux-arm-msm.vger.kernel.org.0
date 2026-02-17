Return-Path: <linux-arm-msm+bounces-93097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJGVN+c2lGlpAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:37:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610E14A78E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F37D3005753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311EF30E829;
	Tue, 17 Feb 2026 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feXbYHQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pcs+p9Kb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4830F552
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321047; cv=none; b=hROxUfdL/t6wNYkxkSOfOFEBkjLz4OBBrVuE68Iq7dsFTwwf7tysRtxMzevb8WK84WEsGK3pRYTipXCqgRYpN8z5gXkxN4iobj4y77mrDLnKp5+JfYjEgNGe13wZpCZgVIVu9kPvRo9b9B0pXEsVyJzuaw+FCySZuJlQHCgRJ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321047; c=relaxed/simple;
	bh=nWarlm9S+UhsDH4rAeEFiXLPjKq9k9/MBVQr/7Sq/a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIcSvTIOGLaYm3vCyD5h7AdzsvFlxUAPjNq/zRrqBxuJY00Qih3fkii12lFPlgMHhVX+CLUWjdyJo+FcGyG7LapWlNzFhl/TVh1LV+iIwkDVBUgqfWCfOGcIftLNqM2XURUGi59UMtXvF0CQeaMwYA7m0JPn0QEVqq4sNa6gYDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feXbYHQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pcs+p9Kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL82cJ1614018
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=; b=feXbYHQhsk6KyW0C
	jcPzZ366sWvrGDbdYnV76NaLBOIm4/riC6VmAwtTajiJDBuKy7OJYlhgSLXVQSNL
	jHSQvPxwmOzKcHJUVcXFJGlDGuYUrzhghVraHuDfA6GBOjzDiI7SgiarKjiMtS+y
	cjObx9Hi9RF5rH6jsMxFOTFEe5XvkECBK+GAEUEzqbbXkaZxrLlQVEMD5ohGIp78
	7s5QA1mvtoEGZDHkhZkIDAWBNg6SSGRGuIGWt1mXeUPByvArbtxWukL/OUUHRK4J
	vctRiOxUlXZN5sbKOZRqTl0VHN0Oc78+kIV6bWF+F8rMEfR+696h+hThz5JVjWI8
	/M0f6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sv9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:37:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb456d53a5so308812785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771321044; x=1771925844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
        b=Pcs+p9KbDJ/dYPp1sa+oS4V1V80bQKmh3Wc8ripKpPrzHkLuhizHjlAoUSCsxabp3O
         v0HKiJUc2Y1+1hFcAMqciy4SKMcpvpHTlh4ldQfkdNzaHA/CnxrqE8ySczenVcM/YnhW
         DJaM9QbtVWtVl2toAYtRRqiQywd3+RtqOdcS3iqFJveinUIQwm523sTRa2dfdgJFfmDI
         d7CIH3C8yU/UNuuVIxiHOQfaYA4iRX4T6P0rQqxKtd6WfWzQQyOZ2tBvcF1YmY5y7T0M
         +J6ILmhs6FLIAo2jqdJqKcSH4Cm2rOeDXCv4R8GPP5QL/5UV9xCM40vOL7ZpJ3UybozY
         PM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321044; x=1771925844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
        b=fnM7ORG3qtFiQriiNgF8Vpm9O0XTXPNVBk+UGgTYT85tvXKFMkvCn3E33VcIjs+qBN
         XShXx68Z7kKu9G8cq4C8IeU9NdNh7SI98U/9Vh6I5+jEIQChg6vkKkVX8REsa8Cnl6CK
         fEPJz59ER+mJfe6GPiYuim9it+P2XNqiEFyglPeeS9cMzFgHc34/+bTyrZIWSWws5G+L
         Ih5Dtp+kKLhA8EnP7y0dg1dLYXKiouCEllUk4aEHspfsurTvm3OIvucuNs7+7g1Cv7U/
         9ONy4SUqo9FO72amZTTMzAM305xGNijgxc9y8xpfYIErDc08AJr2R2EBMzOw1UiXZbKi
         uz2w==
X-Forwarded-Encrypted: i=1; AJvYcCVLZDWcV2cAJQJ03XCzaga/jcLWWM9Ban8I/wmbTrKxy3s9LM3E4q9aTjB2YT/cEXBJKK8GmFSJBfz8HzJY@vger.kernel.org
X-Gm-Message-State: AOJu0YwqjtRLqL1ABM/Q4Jm41G0NOxiisGpwTs46ohMpxsGPo4C3I1GS
	4J1iBA4N1pOPbTAvBzvYOmSVaIig0eVQC1Cgr/qpV9cyUL2seSg5IRlT/MCzFXzQ77v5WAHhJdE
	T60b+WSfRqS9K/YZa6978kMONXwu5yw39Eg3h47mKYzKdrm+Dxvbi4Xnn3NlFB8X+cFGl
X-Gm-Gg: AZuq6aLgziaWz5fHPuLFUCYjgNI5VfOnUcvzc+n2eN6PxHw9GFiItCaSBLXW3lanXwr
	Q9zCrEa1+zbgZSyH3jLeLCBLL0ztQ3SHTHCeR9+irbZc+m0/9AJilFZ3QSMskTWdzYw9vwrliIO
	Nq6JeqcApP/5MQngP4HlFkgUKNXmwRXWLpqoz4NNo8Te5y5+0RIN13SrNI6FZJJ66DS/u/D/9GA
	y8H1ip2Rm56sTFTxql10yQPbK4smmmZuG1Cc0VvTivqDhi4SJrhmmnYQCTPYHaWTa0Ox5TBx26F
	ZeYF0iD24LQofIfTrlEcQdCQ/rY5MDq9viZ6Su7Ub678uApw1qMb0wH6/6rKZ9OVSYmWJWZI5r7
	yDnZ3b55CnBlJpyXZ2y8zUDslcMTs2xhsT7q2Bl76KO3bV7VzpFqgIC2J7UqWChgUePhwsfGRM1
	38IMQ=
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb409141eamr1276350085a.10.1771321044281;
        Tue, 17 Feb 2026 01:37:24 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb409141eamr1276347785a.10.1771321043876;
        Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691f0esm337654766b.60.2026.02.17.01.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Message-ID: <1653cdde-4db3-4473-9007-676a5bb23e16@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:37:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX37nmHNAHgn8r
 HbHWwVu/AGyXe+sAJht/IQjY5aE/C20oG75iVVcFSrSb2LdYaPX+GKaAkOVKxeUk49jKKE+Hrdn
 Az71GcdZlyPQ6EEggVyGReOrOFlT0L4/wnASu7mHQeOjNeFdw1ILVQhZd2QXH7uerww75mytZCS
 hQQwouUGzeglvMs/rD90N7uW8sskZvQQQ5bGYU3ROzrJYkTSiXhTMDchMdua/KofxAO9ulNFOZv
 lZixFjvV5gFgCmi1lwLiUG6VTRxloqq0aTXPfu6fSy9pj8eB90YRRXo5yNMPJSyRho3tHrnAwCa
 rUQNtk4TrTONpA9eL8qMn1nHLuVyDx98yCPZO74SH+dHO43zwpRMgiTCs+QZXYWwdbBraLizauu
 uywpFd7eNX73OLswFMiGs4DCsS6lfpxY7CeMBljzTG0Op7r/0MwI/Ouog+nslWuP0h3ujHMu6o0
 v7noVYGnnHnzhGeWOGw==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=699436d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WUjSHTguBGJ-OPDXwhrPvtMm6nnJyomN
X-Proofpoint-ORIG-GUID: WUjSHTguBGJ-OPDXwhrPvtMm6nnJyomN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93097-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4610E14A78E
X-Rspamd-Action: no action

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

