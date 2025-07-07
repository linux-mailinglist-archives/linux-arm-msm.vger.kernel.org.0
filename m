Return-Path: <linux-arm-msm+bounces-63908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B47AFB00C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93F243A5518
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF0028DF28;
	Mon,  7 Jul 2025 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOtNiuF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D01C6FFA
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881591; cv=none; b=Us2VyOcgujY25dxLCZtXFtBrz99AT7YZFz+euvU/TVEt7fJrN2JBB4IfX770fdI2ZvjxhEqhZdRt7kf1b4H47YpeMKAgLjmEkry8xTrqNvsSDTa9OhDHoV2Mu1I4oInGzgXrFFyGgZBycPmgPjFzBq35VyxSW09nwxpM9GRphXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881591; c=relaxed/simple;
	bh=OtL42SblJuwL/iQ9u3KKD5n0mW2VXGf4yTUuORHopi8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+6C8yDpg3+GjN1ahJklmrviGjC2yb9hDeHdBXcpSoIr2nh35ktD21aEaWT1A7feyd+c4R/O7ijfBEVXCOYCD/x6XQa/Fd7J+PQCaZHrnEWkTVs8JYUrbZJH3g8DNMDfnXMtR63LoWmT2xHuW2RPBdPydWfwqAY+CyZcSOtPWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOtNiuF9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679Uc0Q032560
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 09:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HPF7x/UVdVGmPfmFK+oiHo83
	1UUpOhq3XXs0VR82TrY=; b=LOtNiuF9MaZFAY41D2WkItzViub0ZDg4EYLfmKp5
	MDn3V2Xi0UvUT02ueoP5ndA+CAAlK+rb2mN7ppoadUtLTk3bKlyR5ipYhHYSN9WO
	oHsLvaiJXCBHoaZkmx4dAw63Y85loGksYmp73Bdma/beV3iKplY3InjwoIXTeBzr
	NW7jxk+HGt98A/SeGKM4143+T6Jai77mYNaRenF524znXxvHKor8gk5ndkPHAET9
	4xjvtr0p1bBi4hUqs6F169yurAjMdqL8qcmNrbvoVozChHCqxyf1QfEzid6Zxtm8
	JoZjNvIga5dCc3LA2WqCkM7UcSihAEwvBUA+hZZ/6/+Qpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2av0pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 09:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3cbf784acso872691685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881588; x=1752486388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPF7x/UVdVGmPfmFK+oiHo831UUpOhq3XXs0VR82TrY=;
        b=GYEA1SraDHwFccFprlU/p/s5UmSXzooffl0vzKcDSh44Y9esLr3yZ0+07DozPsQAJx
         zlaoJcZEzWn4gUH0c46DIs8/je3U2uNB95raSAzKL4WYm7KFL7kQI52XGT4U4S8AV2zG
         UrcuZ6YLbSzX+BCWsP90PHuTDutW9uR0IWkTYE3zUigzFhGxW01eknR1h7sCRLfAyccA
         2e/2g8U6ntq+iZowc3DO2Q/R8JqOsoyrrpeMcaTp+nEzSYCJwFaOyp8AAm+QZvjo4b/Q
         5ahCl9tg/3055Oq0uREIeivNyT37BCnKPI9nVF8/VqjZjgGye2R+WL7GsbVL4jyD3pAJ
         wYEg==
X-Forwarded-Encrypted: i=1; AJvYcCUqE4lRbD6AfKSTalt3Rl/vhajmKv8SY5kp/Hhawx15rFzn5wHWtrHZiZWQNVH90ON4A5MBTX3uEENaUgPq@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFfKD8a9AhkGtsRmC/lCYzr2Xq2Uc/5XQUdEXDJNdA9N7f63s
	AzB20S8vLp/WfUJdthA/W01Ok9x7g1UO2zzz1fblQSZsi3ABUN5KXG5ibyjrn3QnFnCpijLMO+s
	M+vKRwfpccIinSzjfh9e1Siq4VzMapTeNa1Ktc3pnmVTwv4r1Ck38t9HSnroy2mUMi571
X-Gm-Gg: ASbGnctZpE4HguPwve2LoOPBnWorFm9j0FTpaJ6ejrpmS4sr+L9DZdg1oswNMOGF28S
	1ZMfE2wM4iHN1FZaC/5AQCjZ3bAAUzHvOQrEeKqPDawL+hJZB/i50yS2G6J+XbIPG2uTSKk+moK
	f7nvI6JLQglVShF2bUsWEM/B52zkqBVxtwBJpmu+s358W4z3W4klTqisZt3/hwctq63rvIqT0fU
	ltIx3HFZZWfcxwxkODQHtW+Y1ojAMG3RX34/TVMBQ2Is32JenHyQMR1wLr22KrFaKjtUdlzTW9k
	m/a95TJzrbcR2Wqbno/unJ1oJBIVsCsMRzSXipeky72NqN47/yq0ufE=
X-Received: by 2002:a05:620a:3ac3:b0:7d9:7096:4910 with SMTP id af79cd13be357-7d9709658e6mr17734185a.1.1751881588307;
        Mon, 07 Jul 2025 02:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERnaAx96TWDQnkgjw5rk9fHNmbg+Q+1oudm8xw+KqUwBmecYtg91riWdtVkFc3XSBIK4Ujpg==
X-Received: by 2002:a05:620a:3ac3:b0:7d9:7096:4910 with SMTP id af79cd13be357-7d9709658e6mr17731285a.1.1751881587760;
        Mon, 07 Jul 2025 02:46:27 -0700 (PDT)
Received: from trex (97.red-79-144-186.dynamicip.rima-tde.net. [79.144.186.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1628d60sm105878065e9.13.2025.07.07.02.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:46:27 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 7 Jul 2025 11:46:25 +0200
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aGuXcWpYWWGb8w8i@trex>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
 <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1NiBTYWx0ZWRfX17yVRfAzD68G
 Gk6kn9rAB8UMkdi5CbptDurSy0xQZDULKvafLqWCvMO+Cl5rzZPgqvZT7emC83hvSB2bnDiNEPD
 Xn08eIAVwDbZ30Ac7VLD3vd8MlLwauapOoUisNUh2zvXcGMfj6dAajcPiv1ZiJsJqNlpY/WMEEg
 73a2QfIZGSvaqAwjbLA20bDbyGy2Q8mvxlWBX7h/vwP92QSfLROabY9g+jcFO5QsfYxHGyaThpH
 fHRpOvfgvK+dkNrCaqwphHKy2wWg9MUVVzLrSw/k18n0k4syZbYYgkulc14CTZBpWecmhLyvhdg
 2rSC451rF+j4lyzFDc/Vb864YOmxyO9Xs+B4W9E4VsKAE5FRJfdDccVQbKmHBC+ODc1/U8UEv4m
 QySxtcD4OkpIOX73D3WsaWqvwF/F3S7MCrRikE+2/yjGOwSMBvwNqDCGYtjm1oTknaJM90V8
X-Proofpoint-ORIG-GUID: xtS4E1ur2UJj_wpYJqMGh9StfYYfEEc4
X-Proofpoint-GUID: xtS4E1ur2UJj_wpYJqMGh9StfYYfEEc4
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686b9775 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oX6B8lV6/A+qF9mARCc04Q==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=pN9oTmNYFZMgXM7mCI4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=759 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070056

On 07/07/25 10:29:56, Bryan O'Donoghue wrote:
> On 07/07/2025 10:26, Jorge Ramirez wrote:
> > > > > +    maxItems: 5
> > > > 2 should be good to support non secure usecases. 5 not needed.
> > > ok
> > isnt it better to just leave 5 here - thinking of the future support for
> > secure buffers - and just update the dts?
> 
> It should describe the real capabilities of the hardware, not the expected
> use-cases.
>

then five.

> ---
> bod

