Return-Path: <linux-arm-msm+bounces-56498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E99AA7276
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73FF1889F96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72BD243371;
	Fri,  2 May 2025 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="FZW0Zshq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12olkn2041.outbound.protection.outlook.com [40.92.23.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414456FB9;
	Fri,  2 May 2025 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.23.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189973; cv=fail; b=coESt8vhYy1lmxkYEvrfJiUOrDi8mWkQSdif9t9/fKAWDrpthMhIGQ2nK4yNtTRy4QE2aJ0UltXBPSHEboOa5Bj7Aw15AZ/NI6nHRWhAv+AX5wJNpYJWk4Q18XhtQc68evCmd0vrX+6GEjKD0eUu1lFnbdz2QT/4UtuJ65NJlF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189973; c=relaxed/simple;
	bh=pYwJ0K6rqs+/IS4zbHbfFpWBHe1rmW3rlAxef8yepzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bW2d2zLCkKcH3HeM9hsv5DwJa1nIubexme1P4qRUJi3Kg0jjzwNDb64+nfOoeC8f4XqVoxvrv+uNU236TbnugXgP9fVApw7qps6UcmOsM5ZYIhWdftit7Nctza2eVvt6t5ZNLVuyo5Y2kZps+ktQ/68k2Yd2NaeuyC8/qkZm090=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=FZW0Zshq; arc=fail smtp.client-ip=40.92.23.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnKtUsf9yK3s6oGrzfm5jH46m2TpmGCXccfkXGEbr1raLJhWAkfebgENpoSeUa55p+UUby7RqKQDSDWyCwcCfezWztO9arBMvE/L3MgILai9AUgZX5yv7jQ7HAfBvkbin9EOyrtGTdU8I5KEYtnScTlgd7MQw727H7WMzzxbrHvYZsiuT660/o66R3t+ZnIRK2xVmAcYy5s7QJy72kttm3/9mMPEiUpU1fupLbeiM+86a7ASIrJD6N5LdgkeN1skH2voJ1cT5TnSPbXEXxQBlNyzfcrwmZ2boQtl3os2koeQjxCEyJNggiLWehpvglaHU+lNBXDBTyD8AXjD98+tYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqimVwtsJWIPl2WoFd3wXeieWp9w5GNZhSwWuxUsBgE=;
 b=b6zXsnSRKR/lphs7I+Xju/l4TaeXEYykm4CS5MKkWGMw3/Gda415+H8H6vtymarrOrXy7U5lcAwmj8l5o7CBqmNnp27KujnmvPypU7+beVjwlqbsqMV/Le6OUtNrN5fb6f/mVQYO24tV33lXEs/LATY1+Qe/XLUgR0uo/zqJExeqpSWtL9a9TMzhGjrJ4JNnTvmTSmCt9NCrioJTQ/s6BE7rsQffGNc09I0QgbbJ691CrLSw9MJQoTdnCPUNmEbfILAgUh2EWfW3T3nMUc3W52eBzqtOIsIuE4E4j8qDXuhCCCvLDBJ40V7WThroBU2DhixjE5JYPWQxfi4T6R3mNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqimVwtsJWIPl2WoFd3wXeieWp9w5GNZhSwWuxUsBgE=;
 b=FZW0ZshqCpUnORnYq+uGzQyeUYOLM7Fqk91tljH7K1dOY3r+6QiIQVmIOmicdkdxx+9JhzFNz0YaCkZbk2SehtVUvvOLnYU/y4OwAfCz8HozqKQrpnFghRD7Rz4+tQ00CJq9CVYm5/TL2ue8GbtF6fSxGnL3Q4yF5IhwyTgKLKGe/ox5wq/yu1j5/3GQm7zDev2b5t7tKSLL2Pt5vyc60M4D6onwKJioQN9VVLpiYWUxmCXeFeL2gp5QeHNtvcQ77j6Rmn0wqQ0YeklMlhZRRppKuL08T3dPBsnOTZlURcZU4peszOYfz+6Wt6Pzo1Eg2XkentQwuFZ4OXkkUxzGsg==
Received: from DS7PR19MB8883.namprd19.prod.outlook.com (2603:10b6:8:253::16)
 by SA0PR19MB4333.namprd19.prod.outlook.com (2603:10b6:806:88::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Fri, 2 May
 2025 12:46:10 +0000
Received: from DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305]) by DS7PR19MB8883.namprd19.prod.outlook.com
 ([fe80::e0c2:5b31:534:4305%4]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 12:46:10 +0000
Message-ID:
 <DS7PR19MB888311FA3E79AD9F77FBD1BF9D8D2@DS7PR19MB8883.namprd19.prod.outlook.com>
Date: Fri, 2 May 2025 16:45:59 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: ipq5018: mark XO clock as critical
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
 <20250502-ipq5018-cmn-pll-v1-2-27902c1c4071@outlook.com>
 <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <1435b068-3bb9-4285-8399-81fc278152c4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DX2P273CA0013.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:8::25) To DS7PR19MB8883.namprd19.prod.outlook.com
 (2603:10b6:8:253::16)
X-Microsoft-Original-Message-ID:
 <b05d9351-cc79-4e60-a6e0-de2fe698098f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB8883:EE_|SA0PR19MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: a239a90d-5c2a-446c-de43-08dd89774fd5
X-MS-Exchange-SLBlob-MailProps:
	LVbdfIC7uFBFP9cp9EJQtdWcvQFEeLlkqg2UaWUzpEVNYmGjWWLewAzZXQP8WhnQ807SZ7fI/k3rSmezblWoFJajbDG1EW0Uu9VGrDuDQ2S8ZgYXp7cjbmcjuHgVWfmn/BHWL6v2q/QwIoYjKmSE6EXt6/02Rx4xEMuqKEADmI4WsAK1w5B4q2cGRHrreNG+GBFu8wmJTfGRRrXmN5X7eaOwYlcCW6gcuKzlweHxF+kTAmyAOv1iETF2qEm/NvYqPul0FA9llzMw2aGFsCw8n/dc0KWv9K17QYuOlBqHvyosIrfMe5MNVr2peqv9ylvJEa+90q1uRJ44FzXWkT7TLqM5sTOWzBvjq7yXxZncoe2mUImsmTOEejAMDGAgLnyGGZnZOUh9KYA9c4pDff9xJAzWD7njErSiZDum6XdjlKOjteFnAuSz6JxLukRiobQrpyqE1wxrSnzZDNUH5SwIC/y7am8C4MjyjFpd+G1znoGJUrb4KBjlsiwita7VJSRHfZle6tBb5ZYkBzgK2g6m6ayKpDiX4Byk6JAQalX4U98twq5sZkdJp6KC1WW8BfxLMqfHtUraY08/0eCWi3XmdmJt6FN3lYGAf2txlmHxT9ijXgg8bkIGaGSBfRosLoBQE/mmFkCu4DGKNUCsVgKN04WOOblSl+epHJrffTmVgQEP7wt1hSiojgu2Qrw3V5A+wX7aOm64gUVsAs4ScB0PlogLIBmowfxuQSuK2cHIBKvCfBwOtHEfoA==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|19110799003|15080799006|5072599009|7092599003|6090799003|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTVSK1dRVGQySHA2R0V3MnkybWNiTWNWMTJBYkswYWZrV3BYL25UT3RHZDlz?=
 =?utf-8?B?bXYrZXlXaExqNFF6T0ZsUEUvTFNjTUZrL1FPNDRKdGJsUFRpWURBZmxwaXdy?=
 =?utf-8?B?MUZ2WW9XNzhOWXl6bEQ1Rkl6QWhONjFGaTI1cWdUOTU2UldKV01SOTZBTDlu?=
 =?utf-8?B?ajA4cnoydUpqTmRzV1R0VjBNeE1GTHFVNGVyYnIzeE5jU0h4QkpUUm82ZktL?=
 =?utf-8?B?Z1ZDTjNGSms0K2VlVythUUR3RGV3WVZzSXhhVGJZQXNoeWZGSFExR0ppYmIy?=
 =?utf-8?B?TjRxK25aZUFDbTdob0RSSUhUQXh0MWZRWnArOTBMMUxnRVZ1K0UyakJZbDVJ?=
 =?utf-8?B?SldPVzZrTDJjZWs0ek5oM05hRXBWSVA3VWpJYjQ5RXZUWmd2WGxWZXpmWnBQ?=
 =?utf-8?B?c09jTHdJdkdjZTUvSE5OTWZvRysrMHpEYUlOdExOYUpCUUZDQVhkazRuaHlx?=
 =?utf-8?B?bWt4QW9Tb1UzZ3RYcmdLdmNManZvR2JNWGthSEdXS1VjSVBqSXo4RTBVYTJI?=
 =?utf-8?B?ZDJ3cGxnV1hXbGZuUlRZVHZBZjhyMkdXWHBTbThnaVZYWSsrbmdleWRtSWsv?=
 =?utf-8?B?VlN3ekRoNlBJYjNCK0ZLVE4vYmRjY2ljUUNHSFNjN1gzK3cwRVgrYis2Qk5E?=
 =?utf-8?B?WmJpdUcxZ25ibVhjQ3ZrRVY5QlJCaXZpTlMzcE92WmpXTVZhOVpQUCs4clN2?=
 =?utf-8?B?anhIU2VtbXgzakVFbWJvUTczU2JZcHhrSUV5aUNGKzdDbERrdjJiWDRHOXlP?=
 =?utf-8?B?ZnhNUU5pc01oVm9yaEZXU215bFNMMzlPQWpRejRTbEZCN2NWaVBwVjNTTDQ3?=
 =?utf-8?B?ZDNDc2k3YzJwekRTSkpKM0owZlkwalFyNDAvTm5XR09kcE5lMUFUUWoxc3lp?=
 =?utf-8?B?SnNxWUk1UmdDRWpMVjFDTnVERGY3aE5nT1AvamVEUjJ3TXYyOXBPaXhNZW1K?=
 =?utf-8?B?YnpFQW12Nk83SlROU1ZDSUpub3NTcnlNWWo3b25lelBOekg4aHZjcUV4NEc1?=
 =?utf-8?B?dlVxNW0zTDdnTmZic2NuZGd1RWpLQmkvbW5JQy91eWNnU1lBbE8xN3dzcktl?=
 =?utf-8?B?U2NqVUVNM3FYVkM2bXRhc3FxUVYyTHo4a0JMSG4vdmFSZ1ZUY2pWU2lWdTNl?=
 =?utf-8?B?L2ZibTVjVUtKanFlVXRTRFhrbVVJREZLR3hkalFsRk5kY2J4d1NjQ2lGQmZJ?=
 =?utf-8?B?UTZ5akNmVi85TTJvWHR2eEp0T3paa1pLRW5JL28yMUVpZi9JVTJaS0ZOTWZD?=
 =?utf-8?B?OFBSZGM2MmlxMGxIaVhSemthUngyRllzMUt3OFpMclBsZzRGRGo1VlBsOExN?=
 =?utf-8?B?RGo0cE1ySUpudGcvczJzaHU1K2VIVml3SWhvY0VqRXBMSG9xdHFybW9iYmg2?=
 =?utf-8?B?T3BsOHBPLzU1MS92ZGJVbmxwaVJ3TUVYSU5VT1lJZjJyYXpNTmY2ZGpidUhr?=
 =?utf-8?B?aDhNQ2dIbExqNFhOczJkMEJ5cUFVQnN1Z1JPTzJGcmJyRHdIc0cyWXpSV0Vh?=
 =?utf-8?B?dlZzRHplVUU3bU13UTA5Uk5peU9xTno2RDRBM2ZVRGkwRWpCK2IxZVZPTWI3?=
 =?utf-8?B?V213Zz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmFvNnZmN0RZYkU3QkhRYncwbytqK3NwdDRmc2tjSEE2amR2aEhQNFNqRytQ?=
 =?utf-8?B?c2VyK0NrOEEvMC9FQlF6bnhWWVlBQzRDZnpLbzVoc2RMRlhsVDRob1B5NXVT?=
 =?utf-8?B?dm9JWDdUeVVZRDdsRjBLVTliMVRGeExDU3o1elBwQ3FjYmlnTWNoZjllNTc4?=
 =?utf-8?B?dkR4Ly9nMm9OaXBYSkpMaVdxU1FVMTZZejIvR05QT0dFQ0NtZTFmK2ZZcDU0?=
 =?utf-8?B?am5welhRdEVyMGpGWlRNSEVoZEY2alFBeXVETlJDbWlaRTBCUHRadk5BSFdG?=
 =?utf-8?B?RiszVUN2YmlncnJHcGNkUXZiSWlHSzg4UjdRaWlhNWFMV25sSVhJRXVaWlRr?=
 =?utf-8?B?UXZiM2NwbWxUVERRVGVSYW5yRkp3cEpiSDl3UXRBNmhWQmRZMWUraHNVODMz?=
 =?utf-8?B?RmJQWTJIcTJlbTBnTDZqbUc4Y2JzeVFkSDFjUE9oVHFKT2p0cUJyZUNCU2J0?=
 =?utf-8?B?UStJWFhIRW9jVjdJelN0OG1ON3UwK1g1NkhGQTR3a0ZVSXl2WmdrbW5LcGFh?=
 =?utf-8?B?YTRmMlAxMlA2dFE3RkhqdFdySXlocVJObUUzV3ZMWkJ1ZlR0TVI1b0NuNjJ1?=
 =?utf-8?B?dm5oRnQwV3h4a0NTZkRMVnFyd3dvdDdsMUE1RU9WR0ZldjcxQjk5MTlySVBu?=
 =?utf-8?B?dnN6cmkrY2JWYWtjVmh3V1hyNUJXcFRUYWE5aGNzZ1d3R00yTk92b3MwVndv?=
 =?utf-8?B?Qi9DanFQeXp6MUtEZndmVDk5akpiT0RBdWJ5Y3lHenFsOG1kd3NGbVNDWE54?=
 =?utf-8?B?dEpnckcvSnQ1VjBnK21JbTBsQnhJejFNVmVmVVNYdjFvVFNRWEhGZVRMcUNO?=
 =?utf-8?B?d3Z6M1hHTXlFTm9WQ3dmZ1JGUjV4d0M4M0NQcnVwdGhEMmNnR3hNTXdyUERZ?=
 =?utf-8?B?cXpCTmlSL2czOXdPOU9TcWxlWFI5MWZnaDZNdDVMaXJad3duQUV0dEFHV2c4?=
 =?utf-8?B?T1FGR3VoNHhlTVh3TVhqVGp5aG9EWVZtb0pTSThjSWxWdTRBQkdKZ3pqZkJM?=
 =?utf-8?B?UjNKYmtFMS9hTHMzWXhDeEZnODdld1UwaXVZTFZJOCtJUnpsSkg0TmlxeVdH?=
 =?utf-8?B?RlQ3S2dLbVU3L2k4MUsvVm5vNENEeUdLUlNUSUxBL05FRGZIVWhnaTIyNWlX?=
 =?utf-8?B?NVB3WXlndXdZNmNLa0RwRmh3VWQ5MkxkMkpHQ2JvV2g0aXg4NldYanVEajlT?=
 =?utf-8?B?RUxZRWpNSU5scXk5ZDZRL29mL1BjZGx1M2NoZTVhK1RLM2IyOWpBYWdTYU9j?=
 =?utf-8?B?WlNUeGpZNGhabWVBbXowQ3hJdmZWQS90S3g5TlVneUl1NExTR0ppNDRzSURN?=
 =?utf-8?B?b3AyTWJLNURheFdHM0FuUHpkY1ByUUMrR0xHVm9WREdXODdYaWZIMXdraXlm?=
 =?utf-8?B?M2g4bHE5NjQvK09KeXlqcjdzWVo4NDZ6VlJiTk82ZS9Ub1FXd01COWIyMEJ1?=
 =?utf-8?B?bStneG9QL1NsdmRTOFkyT3UzUTM3b3QzN000bjFyK0RZcHJBMVpZRlJ6UDdC?=
 =?utf-8?B?cVVIRjZTb3NlZFJ6a21uNHFGS2pSTXpJOGxhMUtxRDYwakdMT1Z3RnBjdGZ0?=
 =?utf-8?B?TitPZDFHNUk5RTRrRWdwS3FEQzdVV1E4QzdpNGRiMEJTVllReEhDUlNNMm9n?=
 =?utf-8?B?M0NDYXhRZlcxejN1Mk93SlJRVVNnVXYyaG5TOC9aL3hNOFNMQ3g0ZHdKQjQv?=
 =?utf-8?Q?TGxZsg0XITwI7IIkWwZ8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a239a90d-5c2a-446c-de43-08dd89774fd5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB8883.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 12:46:10.1333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4333



On 5/2/25 14:29, Konrad Dybcio wrote:
> On 5/2/25 12:15 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The XO clock must not be disabled, so let's add the CLK_IS_CRITICAL
>> flag to avoid the kernel trying to disable the XO clock (when parenting
>> it under the CMN PLL reference clock), else the kernel will panic and
>> the following message will appear in the kernel logs:
> 
> Remove the struct definition for this clock (and the assignment in
> blah_blah_clks[]) and replace it with:
> 
> qcom_branch_set_clk_en(regmap, 0x30030); /* GCC_XO_CLK */

understood, thanks for the quick turnaround!

> 
> Konrad

Best regards,
George

