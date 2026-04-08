Return-Path: <linux-arm-msm+bounces-102291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLBQF10e1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABE3B9CE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B4D330074A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C4358384;
	Wed,  8 Apr 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBt7Mno4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTVF+uyi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D713B0AF8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775640154; cv=none; b=es2IXQJ+/1LdsnAm+IxPfneLUKYy1qSOtnriwLuhchzTj8/SFyvEIebbhdqUsess4Tf/c6uHc8DG0XcLeb5mYSh+PpCH7wH3E8Apd6GOACz8x9sGEbyPH1uLg0jS2zzfBpJj3cvg32g1YpzoaKKv1DrjKZw+FuAm1oNmkDf1vLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775640154; c=relaxed/simple;
	bh=2BhclhT9Q97T00HiP8qg5wipFD+trhNuHjt6zEKFSGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CbsddPpetVIL3hDMOViWScnoC8Kck0wGPtHL/blKmZhsynzhdUGmNx6bVdgmpjnXgUtheCn9ws/PtkbQQzFrlTFPju4NXev/5zf3pXkyV9dJuDWdxW2mBBG5i/4W4dsprbBntxaQ/DLWMm/WaSxx524mNlWe6FQc9kN2SyWQ3QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBt7Mno4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTVF+uyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385VWtM1314369
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=; b=WBt7Mno4FyOd0GyH
	go2ych4Xzh0POTbQH+0wvwjK+/LZbxzli//giAnGuzmrUt8SyY/hVHUcHDWcQyyO
	CWYaFwvjwf388BtESF7DbHI5uQoSGimmcSZPpY7CNohu9HVqQKbkF0CZyPu/kzcH
	q8w8bp7WTAqn3Hk03MjiCM4TkZNKej6q8t4raSmlv0lkqGjiZBMfQHEXhMxs26uV
	0+L4DzKpRMHm6K7IgF23MY0ITG1i71hCLdGP5WLawfav6DslA63MzYTdD5j24qZq
	7UB6zNkftq39qAK3I7x03P+2KSHtYvHLYlw01+jfD5MgxgTSnt5SgobFNbnC/XVU
	mhfOvQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6jf2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:22:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70dd30025fso9926913a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775640145; x=1776244945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=;
        b=KTVF+uyi4cyUsBrBYCsdDdEJgVIDYX7D9aAedldTWN2zkc7oOhKmTj+u8cs+gkZDUO
         o5be7KxRDglszqohYSzsB4fTQxbKzFiJEmZYgXaXuaLQjA68J8g8570oKsCi/GiGBw+U
         akTqlERr3m34Zd9ki7JqP/jUXWS0Vjd0Gd2fAgBFg8OMggoYEq1jMt0QNrv1UWKBxBXg
         twxhugqrSVPIN+Od98C0t3cuZ47X2gOnU5XICu2GFbxM7VyJQhVJsgpjO2XgCTaoM8v9
         +h77j7SDbtAuIlOYPPcZaBROonyLDs0gOVCIYoYoBIe+Zm12GIfw97sduDOA9tJMQk/y
         SAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775640145; x=1776244945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bf4TqWgXnJv8MV94k4Uut8ha/7y7QGO4q5QmtTQZ5AY=;
        b=dgNMdAznyKRxxhtF5caMBom/PYoKVP2NVtqSYhn7X9jKXX/6Lal2qG/qvhmG1EoA+N
         0IUPbUfqTQ7KZMxeVjoaJAU5/C6wZVaDonthBtAhp7Pincb0GExMxrXX2pfLUmEKgoGP
         nkFQ2X/cx1h6z/7SzneCTfS5I4QUMh5jQTsqOf+6Vxy+zqopf9cZ4j3k0FDFdw5LIp/Z
         TwpaOoPUlJCrlbJPNlDJg4TRZt6TmCQklw0kBvYF+Dcd8GSAyN4LiGF7AIj/7u9y0/Jr
         Apae8772ZnquSxjlI7oNP0NqzdbHA761kvEx0BbHK6CHacXnCzgRlZs9to+DX2Pb/CrQ
         IweQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbeFQHLSGdrs/GSg3/Yr96RdCpET0e6whA0mQM/LkByTmK0ATq3MHSWzd0LhG04Z1NTsWRjBFOyTYwQgq5@vger.kernel.org
X-Gm-Message-State: AOJu0YxsYWMW5QP9bejdtg62YKHWJi5uBg/KdGV1gAGcJd+3Gzt+FSqk
	FKgWk4eLOwiMwS4JoFEUCL8lgtUX+1/uosimQO0jN/++pI6CuMPc/jfjxdzLshhvGPY0EFnKiW7
	hTmNZFp+M0fBOgETrR6wWZkGUW7vETt0RJFfIQYgSa6ALuL9mxGwyGkwRs7v3eqgg0/x6
X-Gm-Gg: AeBDieui/qP2hyOk8BMEJYMvqYAPYeA603CF2U9j6CndnuHo0OYWqK13pou96abqhCf
	hvePPydacWhGJLWL1NVaeTIYyg2S5yan7JpSucCW7wCkQ9X2vL4ri0HRqQSp521k/V/rYtNdM6k
	fMyRBDzD2b7gTTMYCos0Jf6GtZlisRsWOKpbYAsHVp8bmWfLWBpnNwLb9L876jfMbfhnYwUZBAS
	dn19zdRPboua+tYysyJB35HD2pMrghYxkAFlMXRV/21W9lPagjuL1z4tqAdCGj+Ls+pQlHss2vu
	4YEJ2SfyzrWv4D6OkikzCgXxGynKILcXHvtz8AcQQop9hfj4XKnZb3xQN7Lig6oMP9/cwD3EpoP
	Eph7+fbeYd3RiaJPh1wsFinsK+0HVorE6s0wGY2gOXdiPgqhWXqPbeQ==
X-Received: by 2002:a05:6a20:432b:b0:398:92ef:1d95 with SMTP id adf61e73a8af0-39f2ee70addmr21171901637.21.1775640145148;
        Wed, 08 Apr 2026 02:22:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:92ef:1d95 with SMTP id adf61e73a8af0-39f2ee70addmr21171879637.21.1775640144653;
        Wed, 08 Apr 2026 02:22:24 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659bedesm17266512a12.30.2026.04.08.02.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:22:24 -0700 (PDT)
Message-ID: <6c48fed6-27df-449b-9e43-00a68e45b9ba@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:52:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
 <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: by1LhY4aEn3scq0qZ_BZacZarc0yjoru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4NSBTYWx0ZWRfX8BE88M7TWzOV
 u8lqKayyKQTnSYU7GqFcRHtuyAcDs1yQ1tkFhG7m3rcJoRmbcq8PkT/bpjpemWLw4BSYFiVys7i
 VaedWrHZGCfYlqJVW+RENyTNeAhTkf7DDktVLeEXSjKmKjrmO2wC9rrun0amDu708Tr7Sl9qgHB
 4XJFgHHUg+2o+vTvxNJqdLAz7922zBF0R4IoB1KNvk03RFTC6eER/wVHmNdKHa3LuSBcIhXqAjm
 om+0TkFQIvZ0iZ/BanXKs4IUnL/joFCTXYM/zY0DnVY20p0UfFs4/tddx2zkkxhyBgOb+YXITyp
 gbY+E43XUFQTv+DehfauLIzTVLxkM84AlF8bSCJVUEg8A9W9Zl3sGjrOnozZMvke6tKO2pBArhu
 vb6/OxaJnFuJ3WykzoNEEcgbnM9ttE9RLNywKr5Gjj1OZFzVra/ezhN0MDM6EMdDGTMeKHAD4jS
 WbC/hD9ZwQrazLpztBQ==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d61e51 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=cgR8ezsCSdHxW5zDJ1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: by1LhY4aEn3scq0qZ_BZacZarc0yjoru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080085
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102291-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01ABE3B9CE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 9/2/2025 2:44 PM, Konrad Dybcio wrote:
> On 8/18/25 8:55 AM, Krishna Chaitanya Chundru wrote:
>> Instead of reading low and high of the mhi registers twice use 64 bit
>> register value to avoid any time penality.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>> index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
>> --- a/drivers/bus/mhi/host/main.c
>> +++ b/drivers/bus/mhi/host/main.c
>> @@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>>  			       struct mhi_timesync_info *time)
>>  {
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> +	u64 val = U64_MAX;
>>  	int ret, i;
>>  
>>  	if (!mhi_tsync && !mhi_tsync->time_reg) {
>> @@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>>  	 * transition to L0.
>>  	 */
>>  	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
>> -		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
>> -				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
>> +		if (mhi_cntrl->read_reg64) {
>> +			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
>> +					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);
> Since you're passing mhi_cntrl to the read_reg64 function anyway,
> perhaps this could remove some verbosity:
Hi Konrad,

Sorry for late reply, in pci_generic patch we are defining read_reg64 only if
readq is defined
in the system.  As per your suggesting if we go define mhi_read_reg64 always,
we need to
have #ifdef inside the mhi_read_reg64() or create a new function  both of them
doesn't look
good better to have this way only.

- Krishna Chaitanya.
> int mhi_read_reg64(...) {
> 	u32 val_hi, val_lo;
> 	u64 val;
>
> 	if (mhi_cntrl->read_reg64) {
> 		...
> 	} else {
> 		...
> 		val = FIELD_PREP(GENMASK(63, 32), val_hi)) |
> 		      FIELD_PREP(GENMASK(31, 0), val_lo));
> 	}
>
> 	return val
> }
>
>
> Konrad


